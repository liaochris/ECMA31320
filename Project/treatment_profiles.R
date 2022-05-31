# Purpose: Create treatment profiles 

# Cleanup environment
rm(list = ls())
gc()

# Import libraries
library(data.table)
library(ggplot2)
library(did)
library(broom)
library(tidyverse)
library(lfe)

# Define convenient functions
`%ni%` <- Negate(`%in%`)

# Set directory
setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")
if (Sys.info()[8] == "noahsobel-lewin") setwd("/Users/noahsobel-lewin/Dropbox/ECMA31320/Project")

# Read data 
wife_data <- fread("Data/final_regression_dataset.csv")

# Collapse housework hours over year and unilateral divorce year 
wife_data_subset <-  wife_data[between(Year, 1969, 1980)]
wife_data_subset[,after_treat := Year >= `Unilateral Divorce Year`]

wife_data_collapse <- wife_data_subset %>% 
  group_by(Year, `Unilateral Divorce Year`) %>% 
  filter(!is.na(`HOUSEWORK HOURS`)) %>% 
  summarize(mean = mean(`HOUSEWORK HOURS`),
            q2.5 = quantile(`HOUSEWORK HOURS`, 0.025),
            q97.5 = quantile(`HOUSEWORK HOURS`, 0.975)) %>% 
  arrange(`Unilateral Divorce Year`, Year)

# Plot trends 
ggplot(data = wife_data_collapse, aes(x = Year, 
                                    y = mean,
                                    group = `Unilateral Divorce Year`)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1973 & wife_data_collapse$Year < 1973, 0.4, 0))  +
  geom_line(color = "darkgoldenrod2", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1973 & wife_data_collapse$Year >= 1973, 1, 0)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1970 & wife_data_collapse$Year < 1970, 0.4, 0))  +
  geom_line(color = "firebrick4", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1970 & wife_data_collapse$Year >= 1970, 1, 0)) +
  geom_line(color = "skyblue4", 
            linetype = "dashed",
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 0, 1, 0))  +
  geom_vline(xintercept = 1973, color = "darkgoldenrod2", linetype = "dashed")  +
  geom_vline(xintercept = 1970, color = "firebrick4", linetype = "dashed") +
  ylim(1400, 2000) +
  labs(y= "", x = "Year") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))
  
ggsave("Graphics/treatment_profile.png")

# fake treatment profiles
years <- setdiff(1969:1980, 1975)
groups <- c(0, 1970, 1972)

dummy_data <- data.table()
dummy_data$group <- rep(groups, length(years)) %>%  sort()
dummy_data$year <- rep(years, length(groups)) 
dummy_data$relative_year <- dummy_data$year - dummy_data$group
fake_path <- 1800 +rnorm(length(years), 0, 2)
dummy_data$outcome <- rep(fake_path[wife_data_collapse$`Unilateral Divorce Year` == 0], 3)

# fake treatment effects
te <- c(-20, -30, -40, -50, -60, -40, -30, -35, -30, -30)
for(i in 1:(length(groups)*length(years))){
  dummy_data$treat_effect_good[i] <- ifelse(dummy_data$relative_year[i] <= 0,
                                           0,
                                           te[dummy_data$relative_year[i]])
  
  dummy_data$treat_effect_bad[i] <- ifelse(dummy_data$group[i] == 1970,
                                           ifelse(dummy_data$relative_year[i] <= 0,
                                           0,
                                           te[dummy_data$relative_year[i]]),
                                           0.5 * ifelse(dummy_data$relative_year[i] <= 0,
                                                  0,
                                                  te[dummy_data$relative_year[i]]))
                                           
}



# fake outcomes                                            
dummy_data$outcome_good <- ifelse(dummy_data$group == 0, 
                                  dummy_data$outcome, 
                                  dummy_data$outcome + dummy_data$treat_effect_good)
dummy_data$outcome_bad <- ifelse(dummy_data$group == 0, 
                                  dummy_data$outcome, 
                                  dummy_data$outcome + dummy_data$treat_effect_bad)
        
dummy_data <- data.frame(dummy_data)
# Plot trends 
ggplot(data = dummy_data, aes(x = year, 
                              y = outcome_good,
                              group = group)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(dummy_data$group == 1973 &dummy_data$year < 1972, 0.4, 0))  +
  geom_line(color = "darkgoldenrod2", 
            size = 1,
            alpha = ifelse(dummy_data$group == 1973 &dummy_data$year >= 1972, 1, 0)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(dummy_data$group == 1970 &dummy_data$year < 1970, 0.4, 0))  +
  geom_line(color = "firebrick4", 
            size = 1,
            alpha = ifelse(dummy_data$group == 1970 &dummy_data$year >= 1970, 1, 0)) +
  geom_line(color = "skyblue4", 
            linetype = "dashed",
            size = 1,
            alpha = ifelse(dummy_data$group == 0, 1, 0))  +
  geom_vline(xintercept = 1976, color = "darkgoldenrod2", linetype = "dashed")  +
  geom_vline(xintercept = 1970, color = "firebrick4", linetype = "dashed") +
  labs(y= "", x = "Year") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))

ggsave("Graphics/treatment_profile.png")
