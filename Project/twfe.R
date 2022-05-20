library(data.table)
library(ggplot2)
library(did)
library(broom)
library(tidyverse)

`%ni%` <- Negate(`%in%`)
rm(list = ls())
gc()

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")
if (Sys.info()[8] == "noahsobel-lewin") setwd("/Users/noahsobel-lewin/Dropbox/ECMA31320/Project/Data")
################################################################################
############################# DATA LOGISTICS ###################################
################################################################################
#import, sort data and select columns
res_clean_raw <- fread("cleaned_psid.csv")
setorder(res_clean_raw, "household", "person", "Year")
selcols <- c("STATE", "person", "Year", "RELATION TO HEAD", "MARITAL STATUS",
             "AGE", "OCCUPATION", "INDUSTRY", "INDIVIDUAL WEIGHT", 
             "FAMILY NUMBER", "FAMILY WEIGHT", "RENT/OWN STATUS", "RACE", 
             "ANNUAL HOURS WORKED", "LABOR INCOME", "CHILDREN COUNT", 
             "YEARS WORKED FULL-TIME SINCE 18", "EDUCATION", "HOUSE VALUE", 
             "LEISURE HOURS", "HOUSEWORK HOURS", "HAS DISABILITY", 
             "DISABILITY LIMITING WORK","haschild","wife",
             "HOUSEHOLD HOUSEWORK HOURS", "Unilateral Divorce", 
             "Equitable Distribution", "State")
res_clean <- res_clean_raw[,.SD,.SDcols = selcols]

# add family column and prefix to year
res_clean[,family := as.numeric(unlist(lapply(strsplit(person, "_"), function (x) x[1])))]
res_clean[,Year:=1900+Year]

# filter for wives who are married, and are the main spouse of the family
res_clean_ppl <- res_clean[wife == 1 & 
                             `RELATION TO HEAD` %in% c(2, 20) &
                             `MARITAL STATUS` == 1 & AGE != -1, person]
res_clean_wife <- res_clean[person %in% res_clean_ppl & AGE != -1]
res_clean_husband <- res_clean[family %in% res_clean_wife$family & wife == 0 &
                                 AGE != -1]

# columns for husband data, adding suffix to make column names different
husbandsel <- c("person", "AGE", "OCCUPATION", "INDUSTRY",
                "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
                "HOUSEWORK HOURS")
newnames <- paste(husbandsel, "husband", sep = "_")
setnames(res_clean_husband, c("person", "AGE", "OCCUPATION", "INDUSTRY",
                              "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
                              "HOUSEWORK HOURS"),
         newnames)
newnames <- c(newnames, "family", "Year",  "FAMILY NUMBER")
# add husband columns to wife table
res_clean_wife <- merge.data.table(res_clean_wife, res_clean_husband[,.SD,.SDcols = newnames], 
                                   by = c("family", "Year", "FAMILY NUMBER"))

#drop columns
dropcols <- c("RELATION TO HEAD", "MARITAL STATUS", "wife")
res_clean_wife[, (dropcols) := NULL]

################################################################################
####################### SANT'ANNA CALLAWAY DATA PREP ###########################
################################################################################

# creating column that tells us the treatment yeat
res_clean_wife[,`Unilateral Divorce Year` := as.numeric(`Unilateral Divorce`)]

# never treated - defined as control group
res_clean_wife[`Unilateral Divorce` == "no" |
                 is.na(`Unilateral Divorce`),`Unilateral Divorce Year` := 0]
# individuals who were in data in all years before treatment was implemented
control_grp <- res_clean_wife[, all(`Unilateral Divorce Year` >= Year), 
                              by = person][V1 == TRUE, person]
res_clean_wife[person %in% control_grp, `Unilateral Divorce Year` := 0]

# always treated - must remove from data
res_clean_wife[grepl(1967, `Unilateral Divorce`), 
               `Unilateral Divorce Year` := 1967]
alwaystreated <- res_clean_wife[, all(Year >= `Unilateral Divorce Year`), 
                                by = person][V1 == TRUE, person]
res_clean_wife <- res_clean_wife[person %ni% alwaystreated]
# add numeric id for individuals
res_clean_wife[, id:=.GRP, by = person]

# ways to split data
# hs education
res_clean_wife[, hasHighSchool := as.numeric(max(`EDUCATION`, na.rm = TRUE)
                                             %in% c(4:8)), by = id]
# worked in year policy passed
ids <- res_clean_wife[`ANNUAL HOURS WORKED` > 0 & 
                        Year == `Unilateral Divorce Year`, id]
res_clean_wife[, worked := id %in% ids]

# had income
ids <- res_clean_wife[`LABOR INCOME` > 0  & Year == `Unilateral Divorce Year`, id]
res_clean_wife[, highearning := id %in% ids]

# working on covariates 
res_clean_wife[, STATE := factor(STATE)]
res_clean_wife[, `RENT/OWN STATUS` := factor(`RENT/OWN STATUS`)]
res_clean_wife[, `RACE` := factor(RACE)]
res_clean_wife[, `EDUCATION` := factor(EDUCATION)]
res_clean_wife[, `OCCUPATION` := factor(OCCUPATION)]
res_clean_wife[, `INDUSTRY` := factor(INDUSTRY)]
res_clean_wife[, `State` := factor(State)]
res_clean_wife[,`Equitable Distribution Year` := 
                 as.numeric(`Equitable Distribution`)]
res_clean_wife[`Equitable Distribution` %in% c('community property','pre-1967'),
               `Equitable Distribution Year` := 1967]
res_clean_wife[, `Has Equitable Distribution` := 
                Year >= `Equitable Distribution Year`]

# working out outcomes
res_clean_wife[, hw_ratio := `HOUSEWORK HOURS`/`HOUSEHOLD HOUSEWORK HOURS`]
res_clean_wife[, husband_dif := `HOUSEWORK HOURS_husband` - `HOUSEWORK HOURS`]


################################################################################
############################## DESHPANDE AND LI  ###############################
################################################################################

# TWFE
# static: 
res_clean_wife[, treat := Year >= `Unilateral Divorce Year`]

lr_twfe <- lm(data = res_clean_wife,`HOUSEWORK HOURS` ~ factor(Year) + factor(`Unilateral Divorce Year`) + treat)
lr_twfe$coefficients[['treatTRUE']]

# dynamic:
for(i in -5:10){
  res_clean_wife[[paste0("treat_dummy_", i+5)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Unilateral Divorce Year"]] == i
}


# create formula quickly
formula <- reformulate(
  c("factor(Year)",
    "factor(`Unilateral Divorce Year`)",
  grep("treat_dummy_", names(res_clean_wife), value = T)),
  response = "`HOUSEWORK HOURS`")


lr_twfe_dyn <- lm(data = res_clean_wife, formula)
summary(lr_twfe_dyn)



