library(data.table)
library(ggplot2)
library(did)
library(scales)
library(dplyr)

`%ni%` <- Negate(`%in%`)

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")

df <- fread("final_regression_dataset.csv")
df[, worked := ifelse(worked == TRUE, "working", "not working")]

df[,mean(`LABOR INCOME`, na.rm = TRUE), by = c("Year", "worked")] %>% 
  ggplot(aes(x = Year, y = V1, color = worked, group = worked)) +
  theme_classic() +
  geom_line() +
  ggtitle(" Mean Annual Salary Worked Over Time") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "Annual Salary ($ USD)", x = "Year", color = "Employment Status Year Law was Passed") +
  guides(color=guide_legend(override.aes=list(fill=NA)))

df[,mean(`LABOR INCOME`, na.rm = TRUE), by = c("Year")] %>% 
  ggplot(aes(x = Year, y = V1)) +
  theme_classic() +
  geom_line() +
  ggtitle(" Mean Annual Salary Worked Over Time") + 
  theme(plot.title = element_text(family = 'Georgia', hjust = 0.2, size = 20), 
        axis.title.x = element_text(family = 'Georgia', size = 16),
        axis.text = element_text(family = 'Georgia', size = 10),
        axis.title.y = element_text(family = 'Georgia', size = 16),
        legend.title = element_text(family = 'Georgia', size = 10),) +
  labs(y= "Annual Salary ($ USD)", x = "Year") +
  guides(color=guide_legend(override.aes=list(fill=NA)))
