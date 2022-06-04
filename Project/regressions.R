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

fwrite(res_clean_wife, "final_regression_dataset.csv")

################################################################################
############################ SANT'ANNA CALLAWAY ################################
################################################################################


#res_clean_wife <- res_clean_wife[`Unilateral Divorce` != "no" & `Unilateral Divorce` != "1992"]

# summary(res_clean_wife[`Unilateral Divorce Year` == 0,..cols])
# summary(res_clean_wife[`Unilateral Divorce Year` != 0,..cols])

# keep option if you want to keep never treated
#res_clean_wife <- res_clean_wife[`Unilateral Divorce Year` != 0]

cols <- c("AGE", "RENT/OWN STATUS", "ANNUAL HOURS WORKED", "LABOR INCOME",
  "CHILDREN COUNT", "YEARS WORKED FULL-TIME SINCE 18", "EDUCATION", 
  "HOUSE VALUE", "LEISURE HOURS", "HOUSEWORK HOURS", "HAS DISABILITY",           
  "DISABILITY LIMITING WORK", "haschild", "HOUSEHOLD HOUSEWORK HOURS",
  "Unilateral Divorce", "Equitable Distribution", "State",
  "person_husband", "AGE_husband", "ANNUAL HOURS WORKED_husband",
  "LABOR INCOME_husband", "HOUSEWORK HOURS_husband","hasHighSchool","worked")

# createFigure <- function(estimate) {
#    est1 <- aggte(estimate, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 0)
#    est2 <- aggte(estimate, type = "dynamic", na.rm = TRUE, min_e = 1, max_e = 5)
#    est3 <- aggte(estimate, type = "dynamic", na.rm = TRUE, min_e = 6, max_e = 10)
#    df <- rbind(c(est1$overall.att, est1$overall.se),
#                c(est2$overall.att, est2$overall.se),
#                c(est3$overall.att, est3$overall.se))
#    df$name <- 
# }




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
                 data = res_clean_wife[id %in% c(treat, control) & `Unilateral Divorce Year` < 1980],
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 #clustervars = c("State"),
                 allow_unbalanced_panel = TRUE)

base_c_est <- aggte(base_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
base_c_est_s <- aggte(base_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10,
                        cband = FALSE, bstrap = FALSE, alp = 0.05, biters = 999)

# Now, we are ready to compute the aggregated event study ( I will average the evense study for 2 and 3 event times)
es_aggregated <- base_c_est_s$att.egt

# Get the influence function for the boostrap
es_aggregated_IF <- cbind(es$inf.function$dynamic.inf.func.e[,1:5], 
                          (es$inf.function$dynamic.inf.func.e[,6] + es$inf.function$dynamic.inf.func.e[,7])/2)


# Now we are ready for the bootstrap procedure
# We will cluster at unit id level
set.seed(123)
es_aggregated_boot <- mboot(es_aggregated_IF, es$DIDparams)

# Now we are ready to go! Let me put all this into a table
event_study_diff <-  data.frame(
  type          = "dynamic",
  event.time= es$egt[1:6], # The last point here is the averaged one. You should modify this in the plots
  estimate  = es_aggregated,
  std.error = es_aggregated_boot$se,
  conf.low  = es_aggregated - es_aggregated_boot$crit.val * es_aggregated_boot$se,
  conf.high = es_aggregated + es_aggregated_boot$crit.val * es_aggregated_boot$se,
  point.conf.low  = es_aggregated - stats::qnorm(1 - es$DIDparams$alp/2) * es_aggregated_boot$se,
  point.conf.high = es_aggregated + stats::qnorm(1 - es$DIDparams$alp/2) * es_aggregated_boot$se
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

# This is one option that I sometimes use when the number of event times is relatively large
p_es_diff1 <- ggplot(data = event_study_diff,
                     mapping = aes(x = event.time, y = estimate)) +
  geom_ribbon(aes(ymin= point.conf.low, ymax=  point.conf.high), alpha = 0.5, size = 1, fill = "steelblue")+
  geom_ribbon(aes(ymin=  conf.low, ymax =  conf.high), alpha =  0.3, size = 1, fill = "steelblue")+
  geom_line(mapping = aes(x = event.time, y=estimate), colour = "black", size = 0.6, linetype = "dashed") +
  geom_line(size = 1.2, alpha = 2, colour = "darkblue") +
  geom_hline(yintercept = 0, colour="black", size = 0.25, linetype = "dotted")+
  xlab('Event time') +
  ylab("Event-Study Estimate") +
  theme(axis.text.y = element_text(size = 9))+
  theme(axis.text.x = element_text(size = 9)) +
  theme(axis.title = element_text(color="black",  size = 9))+
  theme(plot.title=ggtext::element_markdown(size=9,
                                            #face = "bold",
                                            color="black",
                                            hjust=0,
                                            lineheight=1.2)
  )

p_es_diff1




ggdid(base_c_est)  +
  annotate("text", x = 9, y = 1500,
           label = paste("ATT:", round(base_c_est$overall.att, 3))) +
  annotate("text", x = 9, y = 1300,
           label = paste("SE: ", round(base_c_est$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Wife)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL")
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
                   control_group = "notyettreated",
                   clustervars = c("State"),
                   allow_unbalanced_panel = TRUE)
est_base_h_c <- aggte(base_h_c, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_base_h_c)  +
  annotate("text", x = 9, y = 250,
           label = paste("ATT:", round(est_base_h_c$overall.att, 3))) +
  annotate("text", x = 9, y = 225,
           label = paste("SE: ", round(est_base_h_c$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Husband)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c$overall.att, 3), 
            "and standard errors are", round(est_base_h_c$overall.se, 3)))

############ base specification, high school treatment with controls ########### 
res_clean_wife_h <- copy(res_clean_wife)
res_clean_wife_h[hasHighSchool == 0, `Unilateral Divorce Year` := 0]
hs_t <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Unilateral Divorce Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h ,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated",
               clustervars = c("State"),
               anticipation = 3,
               allow_unbalanced_panel = TRUE)
est_hs_t <- aggte(hs_t, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_t) +
  annotate("text", x = 9, y = 1000,
           label = paste("ATT:", round(est_hs_t$overall.att, 3))) +
  annotate("text", x = 9, y = 850,
           label = paste("SE: ", round(est_hs_t$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Wife)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Wife has HS Degree")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_t$overall.att, 3), 
            "and standard errors are", round(est_hs_t$overall.se, 3)))

############ husband hours, high school treatment, with controls ####
hs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME`+ AGE,
                 data = res_clean_wife_h,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 clustervars = c("State"),
                 allow_unbalanced_panel = TRUE)
est_hs_h_t <- aggte(hs_h_t, type = "dynamic", na.rm = TRUE, min_e = -5, 
                    max_e = 10)
ggdid(est_hs_h_t) +
  annotate("text", x = 9, y = 300,
           label = paste("ATT:", round(est_hs_h_t$overall.att, 3))) +
  annotate("text", x = 9, y = 250,
           label = paste("SE: ", round(est_hs_h_t$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Husband)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Wife has HS Degree")

# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h_t$overall.att, 3), 
            "and standard errors are", round(est_hs_h_t$overall.se, 3)))

############ worked treatment, controls #######################
res_clean_wife_w <- copy(res_clean_wife)
res_clean_wife_w[worked == 0, `Unilateral Divorce Year` := 0]

worked_c <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "notyettreated",
                 #clustervars = c("State"),
                 allow_unbalanced_panel = TRUE)
est_worked_c <- aggte(worked_c, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked_c) +
  annotate("text", x = 9, y = 500,
           label = paste("ATT:", round(est_worked_c$overall.att, 3))) +
  annotate("text", x = 9, y = 450,
           label = paste("SE: ", round(est_worked_c$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Wife)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Wife was Employed Year of UDL Passage")

print(paste("overall att is", round(est_worked_c$overall.att, 3), 
            "and standard errors are", round(est_worked_c$overall.se, 3)))

############ husband hours, worked treatment, controls #######################
worked_h_c <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Unilateral Divorce Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                 data = res_clean_wife_w,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 #clustervars = c("State"),
                 allow_unbalanced_panel = TRUE)
est_worked_h_c <- aggte(worked_h_c, type = "dynamic", na.rm = TRUE, min_e = -5, 
                        max_e = 10)
ggdid(est_worked_h_c) +
  annotate("text", x = 9, y = 350,
           label = paste("ATT:", round(est_worked_h_c$overall.att, 3))) +
  annotate("text", x = 9, y = 325,
           label = paste("SE: ", round(est_worked_h_c$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Husband)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Wife was Employed Year of UDL Passage")

print(paste("overall att is", round(est_worked_h_c$overall.att, 3), 
            "and standard errors are", round(est_worked_h_c$overall.se, 3)))

############ base specification, with controls EQ TREAT #############
res_clean_wife_t <- copy(res_clean_wife)
res_clean_wife_t[, `Treatment Year` := max(`Equitable Distribution Year`,
                                           `Unilateral Divorce Year`,
                                           na.rm = TRUE), 
                 by = id]
res_clean_wife_t[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]

base_c_t <- att_gt(yname = "HOUSEWORK HOURS",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` +
                   `LABOR INCOME` + AGE,
                 data = res_clean_wife_t,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 #clustervars = c("STATE"),
                 allow_unbalanced_panel = TRUE)
base_c_t_est <- aggte(base_c_t, type = "dynamic", na.rm = TRUE,
                    min_e = -5, max_e = 10) 
ggdid(base_c_t_est) +
  annotate("text", x = 9, y = 300,
           label = paste("ATT:", round(base_c_t_est$overall.att, 3))) +
  annotate("text", x = 9, y = 250,
           label = paste("SE: ", round(base_c_t_est$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Wife)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Equitable Distribution")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(base_c_t_est$overall.att, 3), 
            "and standard errors are", round(base_c_t_est$overall.se, 3)))

############ husband hours, with controls EQ TREAT ###################
base_h_c_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~  `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_t,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("STATE"),
                   allow_unbalanced_panel = TRUE)
est_base_h_c_t <- aggte(base_h_c_t, type = "dynamic", 
                      na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_base_h_c_t) +
  annotate("text", x = 9, y = 250,
           label = paste("ATT:", round(est_base_h_c_t$overall.att, 3))) +
  annotate("text", x = 9, y = 225,
           label = paste("SE: ", round(est_base_h_c_t$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Husband)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Equitable Distribution")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_base_h_c_t$overall.att, 3), 
            "and standard errors are", round(est_base_h_c_t$overall.se, 3)))

############ base specification, high school treatment with controls EQ TREAT #######
res_clean_wife_h_t <- copy(res_clean_wife_t)
res_clean_wife_h_t[hasHighSchool == 0, `Unilateral Divorce Year` := 0]
hs_tt <- att_gt(yname = "HOUSEWORK HOURS",
               gname = "Treatment Year",
               idname = "id",
               tname = "Year",
               xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
               data = res_clean_wife_h_t,
               est_method = "reg",
               weightsname = "FAMILY WEIGHT",
               control_group = "notyettreated",
               clustervars = c("STATE"),
               allow_unbalanced_panel = TRUE)
est_hs_tt <- aggte(hs_tt, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_hs_tt) +
  annotate("text", x = 9, y = 250,
           label = paste("ATT:", round(est_hs_tt$overall.att, 3))) +
  annotate("text", x = 9, y = 225,
           label = paste("SE: ", round(est_hs_tt$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Equitable Distribution and Wife Graduated from HS")
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_tt$overall.att, 3), 
            "and standard errors are", round(est_hs_tt$overall.se, 3)))

############ husband hours, high school treatment, with controls EQ TREAT ######
hs_h_t <- att_gt(yname = "HOUSEWORK HOURS_husband",
                 gname = "Treatment Year",
                 idname = "id",
                 tname = "Year",
                 xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + 
                   haschild + `Has Equitable Distribution`  +
                   `ANNUAL HOURS WORKED_husband`,
                 data = res_clean_wife_h_t,
                 est_method = "reg",
                 weightsname = "FAMILY WEIGHT",
                 control_group = "nevertreated",
                 #clustervars = c("STATE"),
                 allow_unbalanced_panel = TRUE)
est_hs_h_t <- aggte(hs_h_t, type = "dynamic", na.rm = TRUE, min_e = -5, 
                    max_e = 10)  +
  annotate("text", x = 9, y = 250,
           label = paste("ATT:", round(est_base_h_c_t$overall.att, 3))) +
  annotate("text", x = 9, y = 225,
           label = paste("SE: ", round(est_base_h_c_t$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Husband)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Equitable Distribution")
ggdid(est_hs_h_t)
# notes: doesn't change if you make it individual as opposed to family weights
print(paste("overall att is", round(est_hs_h_t$overall.att, 3), 
            "and standard errors are", round(est_hs_h_t$overall.se, 3)))


############ worked treatment, controls EQ TREAT #######################
res_clean_wife_wt <- copy(res_clean_wife_t)

# worked in year policy passed
ids <- res_clean_wife_wt[`ANNUAL HOURS WORKED` > 0 & 
                        (Year+1 == `Treatment Year`), id]
res_clean_wife_wt[, worked := id %in% ids]
res_clean_wife_wt[, YEAR := factor(Year)]
worked_ct <- att_gt(yname = "HOUSEWORK HOURS",
                    gname = "Treatment Year",
                    idname = "id",
                    tname = "Year",
                    xformla = ~ `ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE + YEAR,
                    data = res_clean_wife_wt,
                    est_method = "reg",
                    weightsname = "FAMILY WEIGHT",
                    control_group = "nevertreated",
                    clustervars = c("STATE"),
                    allow_unbalanced_panel = TRUE, 
                    #anticipation = 3
                    )
est_worked_ct <- aggte(worked_ct, type = "dynamic", na.rm = TRUE, min_e = -5, max_e = 10)
ggdid(est_worked_ct)  +
  annotate("text", x = 9, y = 375,
           label = paste("ATT:", round(est_worked_ct$overall.att, 3))) +
  annotate("text", x = 9, y = 325,
           label = paste("SE: ", round(est_worked_ct$overall.se, 3))) +
  theme_classic() +
  ggtitle("Treatment Effect on Annual Hoursework Hours (Wife)") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "ATT Estimate", x = "Years since Treatment",
       subtitle = "Treatment: State of Residence Passed UDL and Equitable Distribution, Wife Worked \n 
       Year of Treatment")

print(paste("overall att is", round(est_worked_ct$overall.att, 3), 
            "and standard errors are", round(est_worked_ct$overall.se, 3)))


############ husband hours, worked treatment, controls EQ TREAT #######################
worked_ht <- att_gt(yname = "HOUSEWORK HOURS_husband",
                   gname = "Treatment Year",
                   idname = "id",
                   tname = "Year",
                   xformla = ~`ANNUAL HOURS WORKED` + `LABOR INCOME` + AGE,
                   data = res_clean_wife_wt,
                   est_method = "reg",
                   weightsname = "FAMILY WEIGHT",
                   control_group = "nevertreated",
                   #clustervars = c("STATE"),
                   allow_unbalanced_panel = TRUE)
est_worked_ht <- aggte(worked_ht, type = "dynamic", na.rm = TRUE, min_e = -5, 
                      max_e = 10)
ggdid(est_worked_ht)
print(paste("overall att is", round(est_worked_ht$overall.att, 3), 
            "and standard errors are", round(est_worked_ht$overall.se, 3)))

