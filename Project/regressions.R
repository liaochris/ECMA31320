library(data.table)
library(ggplot2)
library(did)

`%ni%` <- Negate(`%in%`)

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")

################################################################################
################## DATA LOGISTICS ###################################
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
############ SANT'ANNA CALLAWAY DATA PREP ###########################
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

#remove people who moved
ids <- res_clean_wife[,length(unique(`Unilateral Divorce Year`)), 
                      by = id][V1 == 1, id]
res_clean_wife <- res_clean_wife[id %in% ids]

fwrite(res_clean_wife, "final_regression_dataset.csv")

################################################################################
############################ SANT'ANNA CALLAWAY ################################
################################################################################

############ base specification, no controls ########################
base <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ 1,
               data = res_clean_wife,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
base_est <- aggte(base, type = "dynamic", na.rm = TRUE,
                  min_e = -5, max_e = 10)
ggdid(base_est)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_est$overall.att, 3), 
            "and standard errors are", round(base_est$overall.se, 3)))

############ base specification, with controls ######################
base_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` +
                    `LABOR INCOME` + haschild + `Has Equitable Distribution` +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
base_c_est <- aggte(base_c, type = "dynamic", na.rm = TRUE,
                    min_e = -5, max_e = 10)
ggdid(base_c_est)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_c_est$overall.att, 3), 
            "and standard errors are", round(base_c_est$overall.se, 3)))

############ husband hours, no controls ######################
base_h <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
base_h_est <- aggte(base_h, type = "dynamic", na.rm = TRUE, min_e = -5,
                    max_e = 10)
ggdid(base_h_est)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_h_est$overall.att, 3), 
            "and standard errors are", round(base_h_est$overall.se, 3)))

############ husband hours, with controls ##########################
base_h_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                       gname = "Unilateral Divorce Year",
                       idname = "id",
                       tname = "Year",
                       xformla = ~  `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                     haschild + `Has Equitable Distribution` + 
                     `ANNUAL HOURS WORKED_husband`,
                       data = res_clean_wife,
                       est_method = "reg",
                       weightsname = "FAMILY WEIGHT",
                       control_group = "notyettreated")
est_base_h_c <- aggte(base_h_c, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_base_h_c)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c$overall.att, 3), 
            "and standard errors are", round(est_base_h_c$overall.se, 3)))


############ base specification, no high school, control issues #####
nohs <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution` +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_nohs <- aggte(nohs, type = "dynamic", 
                  na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_nohs)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_nohs$overall.att, 3), 
            "and standard errors are", round(est_nohs$overall.se, 3)))

############ base specification, high school, control issues ########
hs <- att_gt(yname = "HOUSEWORK HOURS",
             gname = "Unilateral Divorce Year",
             idname = "id",
             tname = "Year",
             xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
               haschild + `Has Equitable Distribution`  +
               `ANNUAL HOURS WORKED_husband`,
             data = res_clean_wife[hasHighSchool == 1],
             est_method = "reg",
             weightsname = "FAMILY WEIGHT",
             control_group = "notyettreated")
est_hs <- aggte(hs, type = "dynamic", 
                  na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs$overall.att, 3), 
            "and standard errors are", round(est_hs$overall.se, 3)))

############ husband hours, no high school, control issues ##########
nohs_h <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife[hasHighSchool == 0],
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_nohs_h <- aggte(nohs_h, type = "dynamic", 
                    na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_nohs_h)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_nohs_h$overall.att, 3), 
            "and standard errors are", round(est_nohs_h$overall.se, 3)))

############ husband hours, high school, control issues #############
hs_h <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution`  +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_hs_h <- aggte(hs_h, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_h)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h$overall.att, 3), 
            "and standard errors are", round(est_hs_h$overall.se, 3)))


############ base specification, high school treatment with controls
res_clean_wife_h <- res_clean_wife
res_clean_wife_h[hasHighSchool == 0, `Unilateral Divorce Year` := 0]
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution`  +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife_h,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, high school treatment, with controls ####
hs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution`  +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife_h,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_hs_h_t <- aggte(hs_h_t, type = "dynamic", na.rm = TRUE, min_e = -5, 
                    max_e = 10)
ggdid(est_hs_h_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h_t$overall.att, 3), 
            "and standard errors are", round(est_hs_h_t$overall.se, 3)))


############ worked treatment, no controls #######################
res_clean_wife_w <- res_clean_wife
res_clean_wife_w[worked == 0, `Unilateral Divorce Year` := 0]

worked <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_worked <- aggte(worked, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked)

print(paste("overall att is", round(est_worked$overall.att, 3), 
            "and standard errors are", round(est_worked$overall.se, 3)))

############ worked treatment, controls #######################
worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked_c)

print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))


############ husband hours, worked treatment, no controls #######################
worked_h <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyetreated")
est_worked_h <- aggte(worked_h, type = "dynamic", na.rm = TRUE, min_e = -5, 
                      max_e = 10)
ggdid(est_worked_h)
print(paste("overall att is", round(est_worked_h$overall.att, 3), 
            "and standard errors are", round(est_worked_h$overall.se, 3)))

############ husband hours, worked treatment, controls #######################
worked_h_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_worked_h_c <- aggte(worked_h_c, type = "dynamic", na.rm = TRUE, min_e = -5, 
                        max_e = 10)
ggdid(est_worked_h_c)

print(paste("overall att is", round(est_worked_h_c$overall.att, 3), 
            "and standard errors are", round(est_worked_h_c$overall.se, 3)))







##

############ base specification, no controls, EQ TREAT ##############
res_clean_wife_t <- res_clean_wife
res_clean_wife_t[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]
res_clean_wife_t[, `Treatment Year` := max(`Equitable Distribution Year`,
                                           `Unilateral Divorce Year`,
                                           na.rm = TRUE), 
                 by = id]

base_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ 1,
               data = res_clean_wife_t,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
base_est_t <- aggte(base_t, type = "dynamic", na.rm = TRUE,
                  min_e = -5, max_e = 10)
ggdid(base_est_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_est_t$overall.att, 3), 
            "and standard errors are", round(base_est_t$overall.se, 3)))

############ base specification, with controls EQ TREAT #############
base_c_t <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` +
                   `LABOR INCOME` + haschild  + `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_t,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
base_c_t_est <- aggte(base_c_t, type = "dynamic", na.rm = TRUE,
                    min_e = -5, max_e = 10)
ggdid(base_c_t_est)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_c_t_est$overall.att, 3), 
            "and standard errors are", round(base_c_t_est$overall.se, 3)))

############ husband hours, no controls EQ TREAT ######################
base_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife_t,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
base_h_t_est <- aggte(base_h_t, type = "dynamic", na.rm = TRUE, min_e = -5,
                    max_e = 10)
ggdid(base_h_t_est)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_h_t_est$overall.att, 3), 
            "and standard errors are", round(base_h_t_est$overall.se, 3)))

############ husband hours, with controls EQ TREAT ###################
base_h_c_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~  `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                     haschild + `ANNUAL HOURS WORKED_husband`,
                   data = res_clean_wife_t,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "notyettreated")
est_base_h_c_t <- aggte(base_h_c_t, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_base_h_c_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c_t$overall.att, 3), 
            "and standard errors are", round(est_base_h_c_t$overall.se, 3)))


############ base specification, no high school, control issues EQ TREAT #####
nohs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution` +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife_t[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_nohs_t <- aggte(nohs_t, type = "dynamic", 
                  na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_nohs_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_nohs_t$overall.att, 3), 
            "and standard errors are", round(est_nohs_t$overall.se, 3)))

############ base specification, high school, control issues EQ TREAT########
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
             gname = "Treatment Year",
             idname = "id",
             tname = "Year",
             xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
               haschild + `Has Equitable Distribution`  +
               `ANNUAL HOURS WORKED_husband`,
             data = res_clean_wife_t[hasHighSchool == 1],
             est_method = "reg",
             weightsname = "FAMILY WEIGHT",
             control_group = "notyettreated")
est_hs_t <- aggte(hs_t, type = "dynamic", 
                na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, no high school, control issues EQ TREAT##########
nohs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_t[hasHighSchool == 0],
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_nohs_h_t <- aggte(nohs_h, type = "dynamic", 
                    na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_nohs_h_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_nohs_h_t$overall.att, 3), 
            "and standard errors are", round(est_nohs_h_t$overall.se, 3)))

############ husband hours, high school, control issues  EQ TREAT ###
hs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution`  +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife_t[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_hs_h_t <- aggte(hs_h_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_h_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h_t$overall.att, 3), 
            "and standard errors are", round(est_hs_h_t$overall.se, 3)))

############ base specification, high school treatment with controls EQ TREAT
res_clean_wife_h_t <- res_clean_wife_t
res_clean_wife_h_t[hasHighSchool == 0, `Unilateral Divorce Year` := 0]
hs_tt <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                 haschild + `Has Equitable Distribution`  +
                 `ANNUAL HOURS WORKED_husband`,
               data = res_clean_wife_h_t,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated")
est_hs_tt <- aggte(hs_tt, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_tt)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_tt$overall.att, 3), 
            "and standard errors are", round(est_hs_tt$overall.se, 3)))

############ husband hours, high school treatment, with controls EQ TREAT
hs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_h,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_hs_h_t <- aggte(hs_h_t, type = "dynamic", na.rm = TRUE, min_e = -5, 
                    max_e = 10)
ggdid(est_hs_h_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h_t$overall.att, 3), 
            "and standard errors are", round(est_hs_h_t$overall.se, 3)))


############ worked treatment, no controls EQ TREAT #######################
res_clean_wife_wt <- res_clean_wife_t
res_clean_wife_wt[worked == 0, `Treatment Year` := 0]

worked_t <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife_wt,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated")
est_worked_t <- aggte(worked_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked_t)

print(paste("overall att is", round(est_worked_t$overall.att, 3), 
            "and standard errors are", round(est_worked_t$overall.se, 3)))

############ worked treatment, controls EQ TREAT #######################
worked_ct <- att_gt(yname = "HOUSEWORK HOURS",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                     haschild + `Has Equitable Distribution`  +
                     `ANNUAL HOURS WORKED_husband`,
                   data = res_clean_wife_wt,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "notyettreated")
est_worked_ct <- aggte(worked_ct, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked_ct)

print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_ct$overall.se, 3)))


############ husband hours, worked treatment, no controls EQ TREAT #######################
worked_ht <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~1,
                   data = res_clean_wife_wt,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "notyetreated")
est_worked_ht <- aggte(worked_ht, type = "dynamic", na.rm = TRUE, min_e = -5, 
                      max_e = 10)
ggdid(est_worked_ht)
print(paste("overall att is", round(est_worked_ht$overall.att, 3), 
            "and standard errors are", round(est_worked_ht$overall.se, 3)))

############ husband hours, worked treatment, controls #######################
worked_h_c_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                     gname = "Treatment Year",
                     idname = "id",
                     tname = "Year",
                     xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                       haschild + `Has Equitable Distribution`  +
                       `ANNUAL HOURS WORKED_husband`,
                     data = res_clean_wife_wt,
                     est_method = "reg",
                     weightsname = "FAMILY WEIGHT",
                     control_group = "notyettreated")
est_worked_h_c_t <- aggte(worked_h_c_t, type = "dynamic", na.rm = TRUE, min_e = -5, 
                        max_e = 10)
ggdid(est_worked_h_c_t)

print(paste("overall att is", round(est_worked_h_c_t$overall.att, 3), 
            "and standard errors are", round(est_worked_h_c_t$overall.se, 3)))

