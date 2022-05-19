library(data.table)
library(ggplot2)
library(did)
library(Amelia)

`%ni%` <- Negate(`%in%`)

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")
res_clean_raw <- fread("cleaned_psid.csv")
res_clean_raw[,Year:=1900+Year]

setorder(res_clean_raw, "household", "person", "Year")
selcols <- c("STATE", "person", "Year", "RELATION TO HEAD", "MARITAL STATUS",
             "AGE", "OCCUPATION", "INDUSTRY", "INDIVIDUAL WEIGHT", "FAMILY NUMBER",
             "FAMILY WEIGHT", "RENT/OWN STATUS", "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
             "CHILDREN COUNT", "YEARS WORKED FULL-TIME SINCE 18",
             "EDUCATION", "HOUSE VALUE", "LEISURE HOURS", "HOUSEWORK HOURS",
             "HAS DISABILITY", "DISABILITY LIMITING WORK","haschild","wife","HOUSEHOLD HOUSEWORK HOURS",
             "Unilateral Divorce", "Equitable Distribution", "State")
res_clean <- res_clean_raw[,.SD,.SDcols = selcols]
res_clean[,family := as.numeric(unlist(lapply(strsplit(person, "_"), function (x) x[1])))]

res_clean_wife <- res_clean[wife == 1 & 
                              `RELATION TO HEAD` %in% c(2, 20) &
                              `MARITAL STATUS` == 1 &
                              AGE != -1]
res_clean_wife <- res_clean[person %in% unique(res_clean_wife[, person]) & AGE != -1]

res_clean_husband <- res_clean[family %in% res_clean_wife$family & wife == 0 &
                                 AGE != -1]
husbandsel <- c("person", "AGE", "OCCUPATION", "INDUSTRY",
                "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
                "HOUSEWORK HOURS")
newnames <- paste(husbandsel, "husband", sep = "_")
setnames(res_clean_husband, c("person", "AGE", "OCCUPATION", "INDUSTRY",
                              "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
                              "HOUSEWORK HOURS"),
         newnames)
newnames <- c(newnames, "family", "Year",  "FAMILY NUMBER")
res_clean_wife <- merge.data.table(res_clean_wife, res_clean_husband[,.SD,.SDcols = newnames], 
                                   by = c("family", "Year", "FAMILY NUMBER"))

res_clean_wife <- res_clean_wife[`ANNUAL HOURS WORKED`<3000]
dropcols <- c("RELATION TO HEAD", "MARITAL STATUS", "wife")
res_clean_wife[, (dropcols) := NULL]

# Santanna Callaway
res_clean_wife[,`Unilateral Divorce Year` := as.numeric(`Unilateral Divorce`)]
res_clean_wife[`Unilateral Divorce` == "no",`Unilateral Divorce Year` := 0]
res_clean_wife[, id:=.GRP, by = person]
res_clean_wife[is.na(`Unilateral Divorce Year`), `Unilateral Divorce Year` := 0]
control_grp <- res_clean_wife[, all(`Unilateral Divorce Year` > Year), by = id][V1 == TRUE, id]
res_clean_wife[id %in% control_grp, `Unilateral Divorce Year` := 0]

alwaystreated <- res_clean_wife[`Unilateral Divorce Year` != 0, all(Year > `Unilateral Divorce Year`), 
                                by = person][V1 == TRUE, person]
alwaystreated <- c(alwaystreated, 
                   unique(res_clean_wife[grepl("1967", `Unilateral Divorce`), id]))
res_clean_wife[, hasHighSchool := as.numeric(max(`EDUCATION`, na.rm = TRUE) %in% c(4:8)), by = id]

res_clean_wife[, STATE := factor(STATE)]

# split on high school
ids <- res_clean_wife[`ANNUAL HOURS WORKED` > 0 & Year == `Unilateral Divorce Year` |
                        Year == `Unilateral Divorce Year`-1, id]
res_clean_wife[, worked := id %in% ids]
res_clean_wife[, hw_ratio := `HOUSEWORK HOURS`/`HOUSEHOLD HOUSEWORK HOURS`]
res_clean_wife[, husband_ratio := `HOUSEWORK HOURS_husband`/`HOUSEWORK HOURS`]

res_clean_wife[, `RENT/OWN STATUS` := factor(`RENT/OWN STATUS`)]
res_clean_wife[, `RACE` := factor(RACE)]
res_clean_wife[, `EDUCATION` := factor(EDUCATION)]

#Base santanna-callaway, no subset
out <- att_gt(yname = "HOUSEWORK HOURS",
              gname = "Unilateral Divorce Year",
              idname = "id",
              tname = "Year",
              xformla = ~1,
              data = res_clean_wife,
              est_method = "reg",
              weightsname = "FAMILY WEIGHT",
              control_group = "nevertreated")
es <- aggte(out, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es)

out <- att_gt(yname = "HOUSEWORK HOURS_husband",
              gname = "Unilateral Divorce Year",
              idname = "id",
              tname = "Year",
              xformla = ~1,
              data = res_clean_wife,
              est_method = "reg",
              weightsname = "FAMILY WEIGHT",
              control_group = "nevertreated")
es <- aggte(out, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es)

out_hssubset <- att_gt(yname = "HOUSEWORK HOURS",
                       gname = "Unilateral Divorce Year",
                       idname = "id",
                       tname = "Year",
                       xformla = ~1,
                       data = res_clean_wife,
                       est_method = "reg",
                       weightsname = "FAMILY WEIGHT",
                       control_group = "nevertreated")
es_hs <- aggte(out_hssubset, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es_hs)

out_nohssubset <- att_gt(yname = "HOUSEWORK HOURS",
                       gname = "Unilateral Divorce Year",
                       idname = "id",
                       tname = "Year",
                       xformla = ~1,
                       data = res_clean_wife_reg,
                       est_method = "reg",
                       weightsname = "FAMILY WEIGHT",
                       control_group = "nevertreated")
es_nohs <- aggte(out_nohssubset, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es_nohs)

res_clean_wife_reg_hs <- res_clean_wife
res_clean_wife_reg_hs[hasHighSchool == 0, `Unilateral Divorce Year` := 0]
out_hs <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~1,
                 data = res_clean_wife_reg_hs,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated")
es_hs_treat <- aggte(out_hs, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es_hs_treat)

res_clean_wife_reg_work <- res_clean_wife
res_clean_wife_reg_work[worked == 0, `Unilateral Divorce Year` := 0]
#res_clean_wife_reg_work[, `Equitable Distribution`:=factor(`Equitable Distribution`)]
out_work_treat <- att_gt(yname = "HOUSEWORK HOURS_husband",
                         gname = "Unilateral Divorce Year",
                         idname = "id",
                         tname = "Year",
                         xformla = ~`ANNUAL HOURS WORKED` +`LABOR INCOME` + haschild,
                         data = res_clean_wife_reg_work,
                         est_method = "reg",
                         weightsname = "FAMILY WEIGHT",
                         control_group = "nevertreated")
es_work_treat <- aggte(out_work_treat, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 5)
ggdid(es_work_treat)

