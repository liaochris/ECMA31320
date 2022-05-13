library(data.table)
library(ggplot2)

`%ni%` <- Negate(`%in%`)

res_clean_raw <- fread("cleaned_psid.csv")
setorder(res_clean_raw, "household", "person", "Year")
selcols <- c("STATE", "person", "Year", "RELATION TO HEAD", "MARITAL STATUS",
             "AGE", "OCCUPATION", "INDUSTRY", "INDIVIDUAL WEIGHT", "FAMILY NUMBER",
             "FAMILY WEIGHT", "RENT/OWN STATUS", "RACE", "ANNUAL HOURS WORKED", "LABOR INCOME",
             "CHILDREN COUNT", "YEARS WORKED FULL-TIME SINCE 18",
             "EDUCATION", "HOUSE VALUE", "LEISURE HOURS", "HOUSEWORK HOURS",
             "HAS DISABILITY", "DISABILITY LIMITING WORK","haschild","wife","HOUSEHOLD HOUSEWORK HOURS",
             "Unilateral Divorce", "Equitable Distribution", "State")
res_clean <- res_clean_raw[,.SD,.SDcols = selcols]

res_clean_wife <- res_clean[wife == 1 & 
                              `RELATION TO HEAD` %in% c(2, 20) &
                              `MARITAL STATUS` == 1]
res_clean_wife[,Year:=1900+Year]
res_clean_wife <- res_clean_wife[`ANNUAL HOURS WORKED`<3000]
dropcols <- c("RELATION TO HEAD", "MARITAL STATUS", "wife")
res_clean_wife[, (dropcols) := NULL]

res_clean_wife_husband <- merge.data.table(res_clean, 
                                           res_clean_wife[,c("Year", "FAMILY NUMBER")])[`RELATION TO HEAD` %in% c(1, 10)]

# deal with housework hours later


#hours worked by women
ggplot(res_clean_wife, aes(x = `ANNUAL HOURS WORKED`)) +
  geom_histogram(binwidth = 100)
#sanity check
ggplot(res_clean_wife[, mean(`ANNUAL HOURS WORKED` == 0),by = Year],
       aes(x = Year, y = V1)) +
  geom_line()
#sanity check
ggplot(res_clean_wife[, mean(`HOUSEWORK HOURS` , na.rm = TRUE),by = Year],
       aes(x = Year, y = V1)) +
  geom_line()
# unilateral divorce
res_clean_wife[`Unilateral Divorce` %ni% c("no", "pre-1967"), Centered_Year := 1900+Year - as.numeric(`Unilateral Divorce`)]

ggplot(res_clean_wife[, mean(`ANNUAL HOURS WORKED` == 0),by = Year],
       aes(x = Year, y = V1)) +
  geom_line()

ggplot(res_clean_wife[, mean(`HOUSEWORK HOURS`,na.rm = TRUE),
                      by = Centered_Year], aes(x = Centered_Year, y =V1)) +
  geom_line()

women <- res_clean_wife[!is.na(Centered_Year) & abs(Centered_Year) <= 5, .N, by = person][N == 11, person]
ggplot(res_clean_wife[person %in% women & abs(Centered_Year) <= 5, mean(`HOUSEWORK HOURS`,na.rm = TRUE),
                      by = Centered_Year], aes(x = Centered_Year, y =V1)) +
  geom_line()

mod <- lm(`HOUSEWORK HOURS` ~ factor(Year), res_clean_wife)
res_clean_wife[!is.na(`HOUSEWORK HOURS`), resid := mod$residuals]


ggplot(res_clean_wife[, mean(`resid`,na.rm = TRUE),
                      by = Centered_Year], aes(x = Centered_Year, y =V1)) +
  geom_line() +
  geom_smooth()

women <- res_clean_wife[!is.na(Centered_Year) & abs(Centered_Year) <= 3, .N, by = person][N == 7, person]
ggplot(res_clean_wife[person %in% women & abs(Centered_Year) <= 3, mean(`resid`,na.rm = TRUE),
                      by = Centered_Year], aes(x = Centered_Year, y =V1)) +
  geom_line()


res_clean_wife[,`Unilateral Divorce Year` := as.numeric(`Unilateral Divorce`)]
res_clean_wife[`Unilateral Divorce` == "no",`Unilateral Divorce Year` := 0]
res_clean_wife[, id:=.GRP, by = person]
res_clean_wife[is.na(`Unilateral Divorce Year`), `Unilateral Divorce Year` := 0]
control_grp <- res_clean_wife[, all(`Unilateral Divorce Year` > Year), by = id][V1 == TRUE, id]
res_clean_wife[id %in% control_grp | `Unilateral Divorce Year` == 1992, `Unilateral Divorce Year` := 0]

alwaystreated <- res_clean_wife[`Unilateral Divorce Year` != 0, 
                                all(Year > `Unilateral Divorce Year`), 
                                by = person][V1 == TRUE, person]

library(did)
out <- att_gt(yname = "HOUSEWORK HOURS",
              gname = "Unilateral Divorce Year",
              idname = "id",
              tname = "Year",
              xformla = ~1,
              data = res_clean_wife[!is.na(`HOUSEWORK HOURS`) & 
                                      `Unilateral Divorce` != "pre-1967" &
                                      person %ni% alwaystreated],
              est_method = "reg",
              weightsname = "INDIVIDUAL WEIGHT"
)
plot <- ggdid(out)
ggsave("test.png",plot,
       scale = 3.5,
       dpi = 4000)

agg.es <- aggte(out, type = "dynamic", na.rm = TRUE)
summary(agg.es)
ggdid(agg.es)

agg.gs <- aggte(out, type = "group", na.rm = TRUE)
summary(agg.gs)
ggdid(agg.gs)

res_clean_wife[,post := as.numeric(Year > as.numeric(`Unilateral Divorce`))]

summary(lm(`HOUSEWORK HOURS` ~  post + factor(State)*factor(Year)
           + AGE + factor(EDUCATION) + factor(RACE) + `LABOR INCOME` + `CHILDREN COUNT`, 
           res_clean_wife[!is.na(post)], weights = `INDIVIDUAL WEIGHT`))
