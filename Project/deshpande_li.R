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

# Set parameters
relative_start_year <- -3
relative_end_year <- 5
data <- res_clean_wife
id <- "id"
outcome <-  "HOUSEWORK HOURS"
treatment_date <- "Unilateral Divorce Year"
year <- "Year"
subpop <- "hasHighSchool"
relevant_vars <- c(outcome, treatment_date, year, id, subpop, "STATE")

# Retrieve groups 
groups <- res_clean_wife[[treatment_date]] %>% 
  unique() %>% 
  sort()
groups <- groups[between(groups, 1970, 1987)]

for(g in groups){
  
  # keep necessary data
  data_dl <- res_clean_wife[between(get(year), 
                                    g + relative_start_year, 
                                    g + relative_end_year), 
                            ..relevant_vars ] 
  
  # create experiment number variable 
  data_dl[, experiment_number := g]
  
  # create treatment variable 
  data_dl[, treat := (get(treatment_date) <= g)]
  
  # drop never treated
  data_dl <- data_dl[get(treatment_date) != 0]
  
  # designate not yet treated as controls 
  data_dl[, control := (get(treatment_date) > g)]
  
  # append
  if (which(g == groups) == 1) data_dl_out <- data_dl
  else data_dl_out <- rbind(data_dl_out, data_dl)
}

# generate centered year
data_dl_out[,centered_year := get(year) - experiment_number]

# make difference plot total
data_dl_plot <- data_dl_out[, mean_outcome := mean(get(outcome), na.rm = T), 
             by = c("centered_year", "treat")][!is.na(mean_outcome)]

ggplot(data = data_dl_plot, 
       aes(x = centered_year, y = mean_outcome, color = treat)) +
geom_line() + 
geom_vline(xintercept = 0, color = 'grey', linetype = 'dashed') +
theme(text = element_text(family="Georgia")) +
xlab("Centered year") +
ylab("Housework")

# make difference plot subpop 1
data_dl_plot <- data_dl_out[get(subpop) == 0,
                            .(mean_outcome = mean(get(outcome), 
                                                  na.rm = T)), 
                            by = c("centered_year", "treat")][!is.na(mean_outcome)]
ggplot(data = data_dl_plot, 
       aes(x = centered_year, y = mean_outcome, color = treat)) +
  geom_line() + 
  geom_vline(xintercept = 0, color = 'grey', linetype = 'dashed') +
  theme(text = element_text(family="Georgia")) +
  xlab("Centered year") +
  ylab("Housework")

# make difference plot subpop 0
data_dl_plot <- data_dl_out[get(subpop) == 0,
                            .(mean_outcome = mean(get(outcome), 
                                                  na.rm = T)), 
                            by = c("centered_year", "treat")][!is.na(mean_outcome)]

ggplot(data = data_dl_plot, 
       aes(x = centered_year, y = mean_outcome, color = treat)) +
  geom_line() + 
  geom_vline(xintercept = 0, color = 'grey', linetype = 'dashed') +
  theme(text = element_text(family="Georgia")) +
  xlab("Centered year") +
  ylab("Housework")

# simple DD
data_dl_out[, `:=` (post = get(year) >= experiment_number)]
lr1 <- lm(get(outcome)~ 1 + post + treat + post*treat, 
          data = data_dl_out) 
lmtest::coeftest(lr1, sandwich::vcovCL(lr1, type="HC1"))

# Dynamic DD
data_dl_dyn <- data_dl_out[, `:=` (f_centered_year = relevel(factor(centered_year), ref = "0"),
                                   treat = relevel(factor(treat), ref = "FALSE"))]
lr2 <- lm(get(outcome) ~ 1 + treat*f_centered_year, data = data_dl_dyn)
lr2_vcov <- lmtest::coeftest(lr2, sandwich::vcovCL(lr2, type="HC1"))
lr2_ci <- lmtest::coefci(lr2, vcov = sandwich::vcovCL(lr2, type="HC1"))

coef_years <- matrix(NA, nrow = length(unique(data_dl_out$centered_year)), ncol = 4)
coef_years[,1] <- sort(unique(data_dl_out$centered_year))
for(i in 1:length(coef_years[,1])){
  year <- coef_years[i,1]
  if(year == 0) coef_years[i,2:4] <- 0
  else{
    coef_years[i,2] <- lr2$coefficients[paste0('treatTRUE:f_centered_year', year)]
    pos <- rownames(lr2_ci) == paste0('treatTRUE:f_centered_year', year)
    coef_years[i,3:4] <- lr2_ci[pos,1:2]
  }
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