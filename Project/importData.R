library(data.table)
library(haven)
library(xlsx)
library(tidyr)
library(stringr)

# set working directory
setwd("~/Google Drive/Academic Work/Sophomore Year/Spring Quarter/
      Metrics Data Science/ECMA31320/Project/Data/")

# import psid codebook
psid <- fread("psid.csv")
# desired columns
Y1968_codes <- c("ER30004", "ER30005", "ER30008", "ER30019", "ER30001", 
                 "ER30003", "V398", "V117","V118", "V239", "V181", "V119", "V314",
                 "V313", "V246", "V10", 
                 "V12", "V103", "V74", "V75", "V93", "V363",
                 "V439", "V47", "V53", "V197_B","V243_B", 
                 "V197_A","V243_A", "V94", "V3", "V7", "V261", "V215",
                 "V73", "V5", "V59")
Y1969_codes <- c("ER30030", "V745", "ER30029", "V481", "V483")
Y1975_codes <-  c("V4207", "V4208","V4209","V4210","V4212","V4214","V4211","V4213","V4215", 
                  "V4103", "V4165", "V3883", "V3941", "V4142","V4111",
                  "V3807", "ER30184", "ER30183", "V4145")
Y1981_codes <- c("V7712", "V7885", "V7713", "V7886", "V7587", "ER30351", "V7555", "V7557")

# generate all codes, separated by space for each data type that we want for 
# all relevant years
psid <- psid[Y1968 %in% Y1968_codes | Y1969 %in% Y1969_codes | 
               Y1975 %in% Y1975_codes | Y1981 %in% Y1981_codes]
selcols <- paste("Y",1968:1995, sep = "")
merged <- str_trim(unite(psid[, ..selcols], merged, sep = " ")$merged)
psid[, final:= merged]
paste(psid$final, collapse = " ")

fwrite(psid, "psid_used.csv")
