library(data.table)
library(ggplot2)
library(did)
library(broom)
library(tidyverse)
library(lfe)

`%ni%` <- Negate(`%in%`)
rm(list = ls())
gc()

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")
if (Sys.info()[8] == "noahsobel-lewin") setwd("/Users/noahsobel-lewin/Dropbox/ECMA31320/Project")

################################################################################
################################ Dynamic TWFE  #################################
################################################################################

# Read data 
res_clean_wife <- fread("Data/final_regression_dataset.csv")

# dynamic:
# make unit year fixed effects
res_clean_wife[, `:=` (f_id = factor(id),
                       f_year = factor(Year))]

#========== Unilateral divorce, no controls, ==========
# make treatment indicators
start <- -5
end <- 10 
range <- end - start
for(i in setdiff(0:range, c(4))){
  res_clean_wife[[paste0("treat_dummy_", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Unilateral Divorce Year"]] == (i-5)
}

# create formula quickly
formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                             treat_dummy_0 + 
                             treat_dummy_1 + 
                             treat_dummy_2 + 
                             treat_dummy_3 + 
                             treat_dummy_5 + 
                             treat_dummy_6 + 
                             treat_dummy_7 + 
                             treat_dummy_8 + 
                             treat_dummy_9 + 
                             treat_dummy_10 + 
                             treat_dummy_11 + 
                             treat_dummy_12 + 
                             treat_dummy_13 + 
                             treat_dummy_14 + 
                             treat_dummy_15 | f_id + f_year | 0 | STATE + id)
dyn_est <- felm(formula = formula_felm,
          data = res_clean_wife, subset = between(Year, 1969, 1989))

dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)

coef_years <- matrix(NA, nrow = length(start:end), ncol = 4)
coef_years[,1] <- start:end
for(i in start:end){
  if(i %in% c(-1)) coef_years[i + 5,2:4] <- 0 
  else{
    coef_years[i+5,2] <- dyn_est$coefficients[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients))]
    coef_years[i+5,3:4] <- dyn_est_ci[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients)),1:2]
  }
}
coef_years <- coef_years[1:(dim(coef_years)[1] - 1),] %>% data.frame()
names(coef_years) <- c("year", "coef", "ci_low", "ci_high")

ggplot(coef_years, aes(x=year, y = coef)) + 
  geom_point(col = 'orange', shape = 17, size = 3) +
  geom_line(col='orange') + 
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
  geom_hline(yintercept = 0, col = 'grey') + 
  geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
  xlab("Years since ") + 
  ylab("")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))

ggsave("Graphics/dynamic_twfe_uni.png")

#========== Unilateral divorce, controls ==========
# create formula quickly
formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                             treat_dummy_0 + 
                             treat_dummy_1 + 
                             treat_dummy_2 + 
                             treat_dummy_3 + 
                             treat_dummy_5 + 
                             treat_dummy_6 + 
                             treat_dummy_7 + 
                             treat_dummy_8 + 
                             treat_dummy_9 + 
                             treat_dummy_10 + 
                             treat_dummy_11 + 
                             treat_dummy_12 + 
                             treat_dummy_13 + 
                             treat_dummy_14 + 
                             treat_dummy_15 +
                             `ANNUAL HOURS WORKED` + 
                             `LABOR INCOME` + 
                             AGE| f_id + f_year | 0 | STATE + id)
dyn_est <- felm(formula = formula_felm,
                data = res_clean_wife, subset = between(Year, 1969, 1989))

dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)

coef_years <- matrix(NA, nrow = length(start:end), ncol = 4)
coef_years[,1] <- start:end
for(i in start:end){
  if(i %in% c(-1)) coef_years[i + 5,2:4] <- 0 
  else{
    coef_years[i+5,2] <- dyn_est$coefficients[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients))]
    coef_years[i+5,3:4] <- dyn_est_ci[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients)),1:2]
  }
}
coef_years <- coef_years[1:(dim(coef_years)[1] - 1),] %>% data.frame()
names(coef_years) <- c("year", "coef", "ci_low", "ci_high")

ggplot(coef_years, aes(x=year, y = coef)) + 
  geom_point(col = 'orange', shape = 17, size = 3) +
  geom_line(col='orange') + 
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
  geom_hline(yintercept = 0, col = 'grey') + 
  geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
  xlab("Years since ") + 
  ylab("")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))

ggsave("Graphics/dynamic_twfe_uni_controls.png")


#========== Unilateral divorce + equitable distribution, no controls ==========
# create treatment year var
res_clean_wife[, `Treatment Year` := max(`Equitable Distribution Year`,
                                           `Unilateral Divorce Year`,
                                           na.rm = TRUE), 
                 by = id]
res_clean_wife[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]

# make treatment indicators
start <- -5
end <- 10 
range <- end - start
for(i in setdiff(0:range, c(4))){
  res_clean_wife[[paste0("treat_dummy_", i)]] <- res_clean_wife[["Year"]] - 
    res_clean_wife[["Treatment Year"]] == 
    (i-5)
}

# create formula quickly
formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                             treat_dummy_0 + 
                             treat_dummy_1 + 
                             treat_dummy_2 + 
                             treat_dummy_3 + 
                             treat_dummy_5 + 
                             treat_dummy_6 + 
                             treat_dummy_7 + 
                             treat_dummy_8 + 
                             treat_dummy_9 + 
                             treat_dummy_10 + 
                             treat_dummy_11 + 
                             treat_dummy_12 + 
                             treat_dummy_13 + 
                             treat_dummy_14 + 
                             treat_dummy_15 | f_id + f_year | 0 | STATE + id)
dyn_est <- felm(formula = formula_felm,
                data = res_clean_wife, subset = between(Year, 1969, 1989))

dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)

coef_years <- matrix(NA, nrow = length(start:end), ncol = 4)
coef_years[,1] <- start:end
for(i in start:end){
  if(i %in% c(-1)) coef_years[i + 5,2:4] <- 0 
  else{
    coef_years[i+5,2] <- dyn_est$coefficients[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients))]
    coef_years[i+5,3:4] <- dyn_est_ci[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients)),1:2]
  }
}
coef_years <- coef_years[1:(dim(coef_years)[1] - 1),] %>% data.frame()
names(coef_years) <- c("year", "coef", "ci_low", "ci_high")

ggplot(coef_years, aes(x=year, y = coef)) + 
  geom_point(col = 'orange', shape = 17, size = 3) +
  geom_line(col='orange') + 
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
  geom_hline(yintercept = 0, col = 'grey') + 
  geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
  xlab("Years since ") + 
  ylab("")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))

ggsave("Graphics/dynamic_twfe_equ.png")

#========== Unilateral divorce + equitable distribution, controls ==========
# create formula quickly
formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                             treat_dummy_0 + 
                             treat_dummy_1 + 
                             treat_dummy_2 + 
                             treat_dummy_3 + 
                             treat_dummy_5 + 
                             treat_dummy_6 + 
                             treat_dummy_7 + 
                             treat_dummy_8 + 
                             treat_dummy_9 + 
                             treat_dummy_10 + 
                             treat_dummy_11 + 
                             treat_dummy_12 + 
                             treat_dummy_13 + 
                             treat_dummy_14 + 
                             treat_dummy_15 +
                             `ANNUAL HOURS WORKED` + 
                             `LABOR INCOME` + 
                             AGE| f_id + f_year | 0 | STATE + id)
dyn_est <- felm(formula = formula_felm,
                data = res_clean_wife, subset = between(Year, 1969, 1989))

dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)

coef_years <- matrix(NA, nrow = length(start:end), ncol = 4)
coef_years[,1] <- start:end
for(i in start:end){
  if(i %in% c(-1)) coef_years[i + 5,2:4] <- 0 
  else{
    coef_years[i+5,2] <- dyn_est$coefficients[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients))]
    coef_years[i+5,3:4] <- dyn_est_ci[grepl(paste0("treat_dummy_", i +5, "TRUE"), rownames(dyn_est$coefficients)),1:2]
  }
}
coef_years <- coef_years[1:(dim(coef_years)[1] - 1),] %>% data.frame()
names(coef_years) <- c("year", "coef", "ci_low", "ci_high")

ggplot(coef_years, aes(x=year, y = coef)) + 
  geom_point(col = 'orange', shape = 17, size = 3) +
  geom_line(col='orange') + 
  geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
  geom_hline(yintercept = 0, col = 'grey') + 
  geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
  xlab("Years since ") + 
  ylab("")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        text=element_text(size=16, family = 'Georgia'))

ggsave("Graphics/dynamic_twfe_equ_controls.png")

