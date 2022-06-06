library(data.table)
library(ggplot2)
library(did)
library(broom)
library(tidyverse)
library(lfe)
library(tidyverse)

`%ni%` <- Negate(`%in%`)
rm(list = ls())
gc()

setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/Metrics Data Science/ECMA31320/Project/Data/")
if (Sys.info()[8] == "noahsobel-lewin") setwd("/Users/noahsobel-lewin/Dropbox/ECMA31320/Project")

################################################################################
################################ Dynamic TWFE  #################################
################################################################################
# DTWFE function
plot_dtwfe <- function(reg_data, controls) {
  
  # assert control binary
  stopifnot(controls %in% c(0,1))
 
  # create formula quickly
  if(controls == 0){
    formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                                 `treat_dummy -5` + 
                                 `treat_dummy -4` + 
                                 `treat_dummy -3` + 
                                 `treat_dummy -2` + 
                                 `treat_dummy 0` + 
                                 `treat_dummy 1` + 
                                 `treat_dummy 2` + 
                                 `treat_dummy 3` + 
                                 `treat_dummy 4` + 
                                 `treat_dummy 5` + 
                                 `treat_dummy 6` + 
                                 `treat_dummy 7` + 
                                 `treat_dummy 8` + 
                                 `treat_dummy 9` +
                                 `treat_dummy 10` | f_id + f_year + f_state | 0 | STATE + id)
    dyn_est <- felm(formula = formula_felm,
                    data = reg_data, subset = between(Year, 1969, 1989))
  }
  if(controls == 1){
    formula_felm <- as.formula(`HOUSEWORK HOURS` ~ 
                                 `treat_dummy -5` + 
                                 `treat_dummy -4` + 
                                 `treat_dummy -3` + 
                                 `treat_dummy -2` + 
                                 `treat_dummy 0` + 
                                 `treat_dummy 1` + 
                                 `treat_dummy 2` + 
                                 `treat_dummy 3` + 
                                 `treat_dummy 4` + 
                                 `treat_dummy 5` + 
                                 `treat_dummy 6` + 
                                 `treat_dummy 7` + 
                                 `treat_dummy 8` + 
                                 `treat_dummy 9` +
                                 `treat_dummy 10` +
                                 ann_hrs_work_control + 
                                 labor_inc_control + 
                                 age_control| f_id + f_year + f_state | 0 | STATE + id)
    dyn_est <- felm(formula = formula_felm,
                    data = reg_data, subset = between(Year, 1969, 1989))
  }
 
  dyn_est_ci <- lmtest::coefci(dyn_est, vcov = dyn_est$vcv)
  
  coef_years <- matrix(NA, nrow = length(start:end), ncol = 4)
  coef_years[,1] <- start:end
  for(i in start:end){
    if(i == -1) coef_years[i - start + 1, 2:4] <- 0 
    else{
      coef_years[i - start + 1, 2] <- dyn_est$coefficients[grepl(paste0("`treat_dummy ", i, "`TRUE"), rownames(dyn_est$coefficients))]
      coef_years[i - start + 1, 3:4] <- dyn_est_ci[grepl(paste0("`treat_dummy ", i, "`TRUE"), rownames(dyn_est$coefficients)),1:2]
    }
  }
  coef_years <- coef_years[1:(dim(coef_years)[1] - 1),] %>% data.frame()
  names(coef_years) <- c("year", "coef", "ci_low", "ci_high")
  
  plot <- ggplot(coef_years, aes(x=year, y = coef)) + 
    geom_point(col = 'orange', shape = 17, size = 3) +
    geom_line(col='orange') + 
    geom_ribbon(aes(ymin = ci_low, ymax = ci_high), alpha = 0.15, fill='orange') +
    geom_hline(yintercept = 0, col = 'grey') + 
    geom_vline(xintercept = 0, linetype= 'dashed', col = 'grey') + 
    xlab("Relative Year") + 
    ylab("")+
    scale_x_continuous(breaks =c(-4, -2, 0, 2, 4, 6, 8, 10)) +
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          panel.background = element_blank(), 
          axis.line = element_line(colour = "black"),
          text=element_text(size=20, family = 'Georgia')) 
  
  return(plot)
}

# regressions

# Read data 
res_clean_wife <- fread("Data/final_regression_dataset.csv") %>% 
  select(c(
    "id",
    "AGE",
    "ANNUAL HOURS WORKED",
    "LABOR INCOME",
    "Year",
    "Unilateral Divorce Year",
    "Equitable Distribution Year",
    "Equitable Distribution",
    "HOUSEWORK HOURS",
    "STATE",
    "worked"))

# make unit year fixed effects
res_clean_wife[, `:=` (f_id = factor(id),
                       f_year = factor(Year),
                       f_state = factor(STATE))]

# drop late treated states 
res_clean_wife <- res_clean_wife[`Unilateral Divorce Year` < 1980]

#========== Unilateral divorce ==========
# define treatment
res_clean_wife[, `Treatment Year` := `Unilateral Divorce Year`]
               
# make controls the value at year before treatment 
res_clean_wife[, year_before_treat := (Year == `Treatment Year` -1)]
res_clean_wife[, `:=`(age_control = max(year_before_treat * AGE),
                       ann_hrs_work_control = max(year_before_treat * `ANNUAL HOURS WORKED`),
                       labor_inc_control = max(year_before_treat * `LABOR INCOME`)
                       ), by = id]

# make treatment indicators
start <- -5
end <- 10 
for(i in setdiff(end:start, -1)){
  res_clean_wife[[paste0("treat_dummy ", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Treatment Year"]] == (i-5)
}

# no controls 
plot_dtwfe(res_clean_wife, 0)
ggsave("Graphics/dynamic_twfe_uni.png")


#========== Unilateral divorce + equitable distribution ==========
# define treatment 
res_clean_wife[, `Treatment Year` := max(`Equitable Distribution Year`,
                                           `Unilateral Divorce Year`,
                                           na.rm = TRUE), 
                 by = id]
res_clean_wife[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]

# make treatment indicators
start <- -5
end <- 10 
for(i in setdiff(end:start, -1)){
  res_clean_wife[[paste0("treat_dummy ", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Treatment Year"]] == (i-5)
}

# no controls 
plot_dtwfe(res_clean_wife, 0)
ggsave("Graphics/dynamic_twfe_equ.png")

#========== Unilateral divorce + worked ==========
# define treatment
res_clean_wife[, `Treatment Year` := `Unilateral Divorce Year`]

# make treatment indicators
start <- -5
end <- 10 
for(i in setdiff(end:start, -1)){
  res_clean_wife[[paste0("treat_dummy ", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Treatment Year"]] == (i-5)
}

# subset
treat <- res_clean_wife[Year < `Unilateral Divorce Year` & `Unilateral Divorce Year` != 0, 
                          all(`ANNUAL HOURS WORKED` > 1200),
                          by = id][V1 == TRUE, id]
control <- res_clean_wife[Year <= 1973 & `Unilateral Divorce Year` == 0, 
                          all(`ANNUAL HOURS WORKED` > 1200), by = id][V1 == TRUE, id]
res_clean_wife_subset <- res_clean_wife[id %in% c(treat, control)]

# no controls 
plot_dtwfe(res_clean_wife_subset, 0)
ggsave("Graphics/dynamic_twfe_uni_work.png")

#========== Unilateral divorce + equitable distribution ==========
# define treatment 
res_clean_wife[, `Treatment Year` := max(`Equitable Distribution Year`,
                                         `Unilateral Divorce Year`,
                                         na.rm = TRUE), 
               by = id]
res_clean_wife[`Unilateral Divorce Year` == 0, `Treatment Year` := 0]
res_clean_wife[worked == 0, `Treatment Year` := 0]

# make treatment indicators
start <- -5
end <- 10 
for(i in setdiff(end:start, -1)){
  res_clean_wife[[paste0("treat_dummy ", i)]] <- res_clean_wife[["Year"]] - res_clean_wife[["Treatment Year"]] == (i-5)
}

# subset
treat <- res_clean_wife[Year < `Unilateral Divorce Year` & `Unilateral Divorce Year` != 0, 
                        all(`ANNUAL HOURS WORKED` > 1200),
                        by = id][V1 == TRUE, id]
control <- res_clean_wife[Year <= 1973 & `Unilateral Divorce Year` == 0, 
                          all(`ANNUAL HOURS WORKED` > 1200), by = id][V1 == TRUE, id]
res_clean_wife_subset <- res_clean_wife[id %in% c(treat, control)]

# no controls 
plot_dtwfe(res_clean_wife_subset, 0)
ggsave("Graphics/dynamic_twfe_equ_work.png")





