# install.packages("devtools")
devtools::install_github("bcallaway11/did")
library(data.table)
library(ggplot2)
library(did)
library(fixest)

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
# only have not yet treated individuals
res_clean[`Unilateral Divorce` != "1992"]

# add family column and prefix to year
res_clean[,family := as.numeric(unlist(lapply(strsplit(person, "_"), function (x) x[1])))]
res_clean[,Year:=1900+Year]

length(unique(res_clean$family))
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

length(unique(res_clean_wife$family))

################################################################################
############ SANT'ANNA CALLAWAY DATA PREP ###########################
################################################################################

# creating column that tells us the treatment yet
res_clean_wife[,`Unilateral Divorce Year` := as.numeric(`Unilateral Divorce`)]

# always treated - must remove from data
res_clean_wife_at <- res_clean_wife
res_clean_wife_at[grepl(1967, `Unilateral Divorce`), 
               `Unilateral Divorce Year` := 1967]
alwaystreated <- res_clean_wife_at[, all(Year >= `Unilateral Divorce Year`), 
                                by = person][V1 == TRUE, person]
res_clean_wife <- res_clean_wife[person %ni% alwaystreated]

length(unique(res_clean_wife$family))

# never treated - defined as control group
res_clean_wife[`Unilateral Divorce` == "no" |
                 is.na(`Unilateral Divorce`),`Unilateral Divorce Year` := 0]
# individuals who were in data in all years before treatment was implemented
control_grp <- res_clean_wife[, all(`Unilateral Divorce Year` >= Year), 
                              by = person][V1 == TRUE, person]
res_clean_wife[person %in% control_grp, `Unilateral Divorce Year` := 0]

# add numeric id for individuals
res_clean_wife[, id:=.GRP, by = person]


# ways to split data
# hs education
res_clean_wife[, hasHighSchool := as.numeric(max(`EDUCATION`, na.rm = TRUE)
                                             %in% c(4:8)), by = id]
# worked in year policy passed
ids <- res_clean_wife[`ANNUAL HOURS WORKED` > 0 & 
                        (Year+1 == `Unilateral Divorce Year`), id]
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
ids <- res_clean_wife[, unique(State), by = id][, .N, by = id][N == 1, id]
res_clean_wife <- res_clean_wife[id %in% ids]

# remove states that passed after 1980
res_clean_wife <- res_clean_wife[`Unilateral Divorce Year` < 1980]
fwrite(res_clean_wife, "final_regression_dataset.csv")

################################################################################
############################ SANT'ANNA CALLAWAY ################################
################################################################################

# change directory to graphics
setwd("../Graphics/")

# summary(res_clean_wife[`Unilateral Divorce Year` == 0,..cols])
# summary(res_clean_wife[`Unilateral Divorce Year` != 0,..cols])

# keep option if you want to keep never treated
#res_clean_wife <- res_clean_wife[`Unilateral Divorce Year` != 0]

# functions to create graphs
generateGraph <- function(data, title_lab, treatment_lab) {
  # Now, we are ready to compute the aggregated event study ( I will average the evense study for 2 and 3 event times)
  es_aggregated <- c(data$att.egt[1],data$att.egt[2],
                     data$att.egt[3],data$att.egt[4],
                     data$att.egt[5],data$att.egt[6],
                     mean(data$att.egt[7:9]), mean(data$att.egt[10:12]),
                     mean(data$att.egt[13:15]))
  
  # Get the influence function for the boostrap
  es_aggregated_IF <- cbind(data$inf.function$dynamic.inf.func.e[,1:6],
                            rowMeans(data$inf.function$dynamic.inf.func.e[,7:9]),
                            rowMeans(data$inf.function$dynamic.inf.func.e[,10:12]),
                            rowMeans(data$inf.function$dynamic.inf.func.e[,13:15]))
  
  # Now we are ready for the bootstrap procedure
  # We will cluster at unit id level
  set.seed(123)
  es_aggregated_boot <- mboot(es_aggregated_IF, data$DIDparams)
  
  # Now we are ready to go! Let me put all this into a table
  event_study_diff <-  data.frame(
    type          = "dynamic",
    event.time= c(-5:0, 2, 4, 6), # The last point here is the averaged one. You should modify this in the plots
    estimate  = es_aggregated,
    std.error = es_aggregated_boot$se,
    conf.low  = es_aggregated - es_aggregated_boot$crit.val * es_aggregated_boot$se,
    conf.high = es_aggregated + es_aggregated_boot$crit.val * es_aggregated_boot$se,
    point.conf.low  = es_aggregated - stats::qnorm(1 - data$DIDparams$alp/2) * es_aggregated_boot$se,
    point.conf.high = es_aggregated + stats::qnorm(1 - data$DIDparams$alp/2) * es_aggregated_boot$se,
    post = c(rep("Pre", 5), rep("Post", 4))
  )
  
  # You can now plot them as you want
  # ggplot2 theme
  theme_set(
    #theme_clean() + 
    theme_classic() +
      theme(plot.background = element_blank(),
            legend.background = element_rect(color = "white"),
            panel.grid.major = element_blank(), 
            panel.grid.minor = element_blank(),
            panel.spacing = unit(10, "lines"))
  )
  
  ggplot(data = event_study_diff,
         mapping = aes(x = event.time, y = estimate)) +
    geom_hline(yintercept = 0, color="black",  linetype = "dotted") +
    theme_classic() + 
    geom_point(aes(color = event.time < 0)) +
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high, color= event.time < 0), width=0.1) +
    scale_color_manual(name = 'Color', values=setNames(c("#e87d72","#56bcc2"), c(T, F)),
                       labels = c('Pre','Post')) +
    geom_vline(xintercept = 0-0.1, color = 'grey', size = .05, linetype = "dotted") +
    ggtitle(title_lab) + 
    theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
          axis.title.x = element_text(family = 'Georgia', size = 16),
          axis.text = element_text(family = 'Georgia', size = 10),
          axis.title.y = element_text(family = 'Georgia', size = 16),
          legend.title = element_text(family = 'Georgia', size = 10),) +
    theme(strip.background = element_rect(fill = 'white', color = 'white'),
          strip.text = element_text(color = 'darkgray', face = 'bold', size = 12, hjust = 0)) + 
    labs(y= "Housework Hours", x = "Years since Treatment",
         subtitle = paste("Treatment:",treatment_lab))  +
    annotate("text", x = 4.5, y = max(event_study_diff$conf.high), label = paste("ATT:", round(data$overall.att, 3))) +
    annotate("text", x = 4.5, y = .9 * max(event_study_diff$conf.high),
             label = paste("SE: ", round(data$overall.se, 3))) + 
    scale_x_continuous(breaks = c(-5:0, 2, 4, 6),
                       labels= c(-5:0, c("Years 1 - 3", "Years 4 - 6", "Years 7 - 9")))
  
}

generateGroupedGraphs <- function(base_group, title_lab, treatment_lab) {
  ggdid(base_group) +
    theme_classic() + 
    coord_flip() + 
    ggtitle(title_lab) + 
    theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
          axis.title.x = element_text(family = 'Georgia', size = 16),
          axis.text = element_text(family = 'Georgia', size = 10),
          axis.title.y = element_text(family = 'Georgia', size = 16),
          legend.position = "none") +
    theme(strip.background = element_rect(fill = 'white', color = 'white'),
          strip.text = element_text(color = 'darkgray', face = 'bold', size = 12, hjust = 0)) + 
    labs(x = "Housework Hours", y = "Year of Treatment",
         subtitle = paste("Treatment:",treatment_lab)) +
    annotate("text", y = 6, x = max(base_group$att.egt + 2*base_group$se.egt),
             label = paste("ATT:", round(base_group$overall.att, 3))) +
    annotate("text",y = 6, x = .9 * max(base_group$att.egt + 2*base_group$se.egt),
             label = paste("SE: ", round(base_group$overall.se, 3)))
}

treat <- res_clean_wife[Year < `Unilateral Divorce Year` & `Unilateral Divorce Year` != 0, 
                        all(`ANNUAL HOURS WORKED` > 1200),
                        by = id][V1 == TRUE, id]
control <- res_clean_wife[Year <= 1973 & `Unilateral Divorce Year` == 0, 
                          all(`ANNUAL HOURS WORKED` > 1200), by = id][V1 == TRUE, id]


############ base specification, with controls ######################
base_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~  AGE + `ANNUAL HOURS WORKED` + `LABOR INCOME`,
                 data = res_clean_wife,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 allow_unbalanced_panel = TRUE)
base_c_est <- aggte(base_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                        cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(base_c_est,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce")
ggsave("base.png")

generateGroupedGraphs(aggte(base_c, type = "group", na.rm = TRUE, min_e = -5, max_e = 9),
                      "Effect on Annual Housework Hours (Wife) by Group",
                      "Divorce")
ggsave("group.png")

# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_c_est$overall.att, 3),
            "and standard errors are", round(base_c_est$overall.se, 3)))

############ husband hours, with controls ##########################
base_h_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ AGE + `ANNUAL HOURS WORKED` + `LABOR INCOME`,
                   data = res_clean_wife,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   allow_unbalanced_panel = TRUE)

est_base_h_c <- aggte(base_h_c, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)

generateGraph(est_base_h_c,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce")
ggsave("husband.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c$overall.att, 3), 
            "and standard errors are", round(est_base_h_c$overall.se, 3)))

############ base specification, no high school with controls ##################
res_clean_wife_h <- copy(res_clean_wife)
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, No HS Subset")
ggsave("nohs.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ base specification, high school with controls ########### 
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, HS Subset")
ggsave("hs.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, no high school with controls #######################
hs_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce, No HS Subset")
ggsave("husband_nohs.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ base specification, high school with controls #####################
hs_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, HS Subset")
ggsave("husband_hs.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))



############ base specification, didn't work, controls #########################
worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife[id %ni% c(treat, control)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, Didn't Work")
ggsave("nowork.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ base specification, worked, controls ##############################
worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                 data = res_clean_wife[id %in% c(treat, control)],
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 #clustervars = c("State"),
                 allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, Worked")
ggsave("work.png")

print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ husband hours, didn't work, controls #########################
worked_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife[id %ni% c(treat, control)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce, Didn't Work")
ggsave("husband_nowork.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ husband hours, worked, controls ##############################
worked_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife[id %in% c(treat, control)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce, Worked")
ggsave("husband_work.png")

print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))







############ COMBINE WITH EQUITABLE DISTRIBUTION ###############################


############ base specification, with controls EQ TREAT ######################
# define treatment when combined with equitable distribution
res_clean_wife_t <- copy(res_clean_wife)
res_clean_wife_t[, `Treatment Year` := max(`Equitable Distribution Year`,
                                           `Unilateral Divorce Year`,
                                           na.rm = TRUE), 
                 by = id]

res_clean_wife_t[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]
# define treated and contorl groups
treat_t <- res_clean_wife_t[Year < `Treatment Year` & `Treatment Year` != 0, 
                        all(`ANNUAL HOURS WORKED` > 1200),
                        by = id][V1 == TRUE, id]
control_t <- res_clean_wife_t[Year <= 1973 & `Treatment Year` == 0, 
                          all(`ANNUAL HOURS WORKED` > 1200), by = id][V1 == TRUE, id]

base_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~  AGE + `ANNUAL HOURS WORKED` + `LABOR INCOME`,
                 data = res_clean_wife_t[`Unilateral Divorce Year` == 0 | 
                                           `Unilateral Divorce Year` - `Equitable Distribution Year` > 0],
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 allow_unbalanced_panel = TRUE)

base_c_est <- aggte(base_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                    cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(base_c_est,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution")
ggsave("base_eq.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_c_est$overall.att, 3),
            "and standard errors are", round(base_c_est$overall.se, 3)))

############ husband hours, with controls EQ TREAT ##########################
base_h_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ AGE + `ANNUAL HOURS WORKED` + `LABOR INCOME`,
                   data = res_clean_wife_t,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   allow_unbalanced_panel = TRUE)

est_base_h_c <- aggte(base_h_c, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)

generateGraph(est_base_h_c,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce + Equitable Property Distribution")
ggsave("husband_eq.png")

# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c$overall.att, 3), 
            "and standard errors are", round(est_base_h_c$overall.se, 3)))

############ base specification, no high school with controls EQ TREAT ##################
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_t[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, No HS Subset")

ggsave("nohs_eq.png")

# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ base specification, high school with controls EQ TREAT ########### 
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_t[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, HS Subset")
ggsave("hs_eq.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, no high school with controls EQ TREAT #######################
hs_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_t[hasHighSchool == 0],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce + Equitable Property Distribution, No HS Subset")
ggsave("husband_nohs_eq.png")

# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, high school with controls #####################
hs_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_t[hasHighSchool == 1],
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "nevertreated",
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                  cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_hs_t,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, HS Subset")
ggsave("husband_hs_eq.png")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))



############ base specification, didn't work, controls #########################
worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_t[id %ni% c(treat_t, control_t)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, Didn't Work")
ggsave("nowork_eq.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ base specification, worked, controls ##############################
worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_t[id %in% c(treat_t, control_t)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, Worked")
ggsave("work_eq.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ husband hours, didn't work, controls #########################
worked_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_t[id %ni% c(treat_t, control_t)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Husband)",
              "Divorce + Equitable Property Distribution, Didn't Work")
ggsave("husband_nowork_eq.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ husband hours, worked, controls ##############################
worked_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Unilateral Divorce Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_t[id %in% c(treat_t, control_t)],
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 9,
                      cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)
generateGraph(est_worked_c,
              "Treatment Effect on Annual Hoursework Hours (Wife)",
              "Divorce + Equitable Property Distribution, Worked")
ggsave("husband_work_eq.png")
print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))



