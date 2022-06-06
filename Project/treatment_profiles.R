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
wife_data_subset[,after_treat := Year >= `Unilateral Divrce Year`]

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
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1970 & wife_data_collapse$Year < 1970, 0.4, 0))  +
  geom_line(color = "darkgoldenrod2", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1970 & wife_data_collapse$Year >= 1970, 1, 0)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1971 & wife_data_collapse$Year < 1971, 0.4, 0))  +
  geom_line(color = "firebrick4", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1971 & wife_data_collapse$Year >= 1971, 1, 0)) +
  geom_line(color = "grey", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1973 & wife_data_collapse$Year < 1973, 0.4, 0))  +
  geom_line(color = "skyblue4", 
            size = 1,
            alpha = ifelse(wife_data_collapse$`Unilateral Divorce Year` == 1973 & wife_data_collapse$Year >= 1973, 1, 0)) +
  geom_vline(xintercept = 1970, color = "darkgoldenrod2", linetype = "dashed")  +
  geom_vline(xintercept = 1971, color = "firebrick4", linetype = "dashed") +
  geom_vline(xintercept = 1973, color = "skyblue4", linetype = "dashed") +
  ylim(1400, 2000) +
  labs(y= "", x = "Year") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))
  
ggsave("Graphics/treatment_profile.png")