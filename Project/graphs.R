# Import libraries
library(data.table)
library(haven)
library(Hmisc)
library(mets)
library(sjlabelled)
library(tidyr)
library(stringr)

# disable scientific notation
options(scipen = 999)

# Set to my personal directory - adjust accordingly
setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")

data <- fread("cleaned_psid.csv")
data[, Year := Year + 1900]
data[!is.na(as.numeric(`Unilateral Divorce`)),
     year_center := Year - as.numeric(`Unilateral Divorce`)]

data[`RELATION TO HEAD` == 1, more_than_hs := max(EDUCATION,na.rm = TRUE) > 3, by = household]
data[, more_than_hs := max(more_than_hs,na.rm = TRUE), by = household]

ggplot(data[!is.na(year_center)], aes(x=year_center)) + 
  geom_density()

#filtering for wife/ex-wife
data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property", 
     .(mean_woman_labor_income = mean(`LABOR INCOME`)),
     by = c("year_center", "haschild")] %>%
  ggplot(aes(x = year_center, y = mean_woman_labor_income, 
             color = haschild, group = haschild)) +
  geom_line()

data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property" & 
       `ANNUAL HOURS WORKED` > 0, 
     .(mean_woman_labor_income = mean(`LABOR INCOME`)),
     by = c("year_center", "haschild")] %>%
  ggplot(aes(x = year_center, y = mean_woman_labor_income, 
             color = haschild, group = haschild)) +
  geom_line()

data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property" & 
       `ANNUAL HOURS WORKED` > 0, 
     .(mean_woman_labor_income = mean(`LABOR INCOME`/`ANNUAL HOURS WORKED`)),
     by = c("year_center", "haschild")] %>%
  ggplot(aes(x = year_center, y = mean_woman_labor_income, 
             color = haschild, group = haschild)) +
  geom_line()

#filtering for wife/ex-wife
data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property", 
     .(mean_woman_labor_income = mean(`LABOR INCOME`)),
     by = c("year_center", "more_than_hs")] %>%
  ggplot(aes(x = year_center, y = mean_woman_labor_income, 
             color = more_than_hs, group = more_than_hs)) +
  geom_line()

data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property", 
     .(mean_woman_labor_income = mean(ANNUAL HOURS WORKED > 0)),
     by = c("year_center")] %>%
  ggplot(aes(x = year_center, y = mean_woman_labor_income, 
             color = more_than_hs, group = more_than_hs)) +
  geom_line()

data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property", 
     .(divorce = mean(`MARITAL STATUS` == 4)),
     by = c("year_center")] %>%
  ggplot(aes(x = year_center, y = divorce)) +
  geom_line()

data[wife == 1 & abs(year_center) <= 5 &  `Equitable Distribution` == "community property", 
     .(divorce = mean(`MARITAL STATUS` == 4)),
     by = c("year_center")] %>%
  ggplot(aes(x = year_center, y = divorce)) +
  geom_line()

