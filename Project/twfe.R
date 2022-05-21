library(data.table)
library(ggplot2)
library(did)
library(broom)
library(tidyverse)
library(lfe)

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
################################ Dynamic TWFE  #################################
################################################################################

# TWFE
# static: 
res_clean_wife[, treat := Year >= `Unilateral Divorce Year`]

lr_twfe <- lm(data = res_clean_wife,`HOUSEWORK HOURS` ~ factor(Year) + factor(`Unilateral Divorce Year`) + treat)
lr_twfe$coefficients[['treatTRUE']]

# dynamic:
# make unit year fixed effects
res_clean_wife[, `:=` (f_id = factor(id),
                       f_year = factor(Year))]

# make treatment indicators
start <- -5
end <- 10 
range <- end - start
for(i in 0:range){
  res_clean_wife[[paste0("treat_dummy_", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Unilateral Divorce Year"]] == (i-5)
}

# create formula quickly
formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                             treat_dummy_0 + 
                             treat_dummy_1 + 
                             treat_dummy_2 + 
                             treat_dummy_3 + 
                             treat_dummy_4 + 
                             treat_dummy_5 + 
                             treat_dummy_6 + 
                             treat_dummy_7 + 
                             treat_dummy_8 + 
                             treat_dummy_9 + 
                             treat_dummy_10 + 
                             treat_dummy_11 + 
                             treat_dummy_12 + 
                             treat_dummy_13 + 
                             treat_dummy_14 + 
                             treat_dummy_15 | f_id + f_year | 0 | STATE)
dyn_est <- felm(formula = formula_felm,
          data = res_clean_wife)

dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)

coef_years <- matrix(NA, nrow = sum(grepl("treat_dummy_", names(res_clean_wife))), ncol = 4)
coef_years[,1] <- start:end
for(i in 1:length(coef_years[,1])){
  year <- coef_years[i,1]
  coef_years[i,2] <- dyn_est$coefficients[i]
  coef_years[i,3:4] <- dyn_est_ci[i,1:2]
}
coef_years <- coef_years %>% data.frame()
names(coef_years) <- c("year", "coef", "ci_low", "ci_high")

ggplot(coef_years, aes(x=year, y = coef)) + 
  geom_point(col = 'orange', shape = 17, size = 3) +
  geom_line(col='orange') + 
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
  geom_hline(yintercept = 0, col = 'grey') + 
  geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
  xlab("Year") + 
  ylab("Coefficient on interaction term")+
  theme_classic()


