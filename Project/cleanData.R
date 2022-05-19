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

# generate codes used to input data
psid <- fread("psid_used.csv")

`%ni%` <- Negate(`%in%`)
PSID_raw <- data.table(read_dta("PSID.dta"))
PSID_raw[,person := paste(ER30001, ER30002, sep = "_")]

# get column names and column labels
all_columns <- data.table(setNames(stack(lapply(PSID_raw, label))[2:1], c("Varcode", "Variables")))
all_columns[,NewVarcode := Varcode]

interview_number <- as.character(all_columns[grepl("INTERVIEW NUMBER", Variables) & grepl("V", Varcode), Varcode])
#seq_number <- as.character(all_columns[grepl("SEQUENCE NUMBER", Variables), Varcode])
acc_code <- as.character(all_columns[grepl("ACC", Variables), Varcode])
county_code <- as.character(all_columns[grepl("COUNTY", Variables), Varcode])

drop <- c(acc_code, county_code, "V3529", iw_date, "ER30002", "ER30000")

remcols <- colnames(PSID_raw)[colnames(PSID_raw) %ni% drop]
PSID_raw <- PSID_raw[,..remcols]

# get column names and column labels
all_columns <- data.table(setNames(stack(lapply(PSID_raw, label))[2:1], c("Varcode", "Variables")))
all_columns[,NewVarcode := Varcode]

renameVars <- function(colname, replname, range) {
  cols <- paste(colname, range, sep = ".")
  all_columns[grepl(replname, Variables), NewVarcode:=cols]
  colnames(PSID_raw) <<- as.character(all_columns$NewVarcode)
  cols
}
#some adjustments
all_columns[Variables == "1972 WEIGHTS", Variables:="1972 WEIGHT"]
all_columns[Variables == "MAR STATUS", Variables:="MARITAL STATUS"]
all_columns[Variables == "HOUSING STATUS", Variables:="OWN OR RENT"]
all_columns[Varcode == "V3421", Variables := "ANNUAL RENT VAL"]
all_columns[Varcode == "V8545", Variables := "INDUSTRY     (WF-E)"]
all_columns[Varcode == "V10678", Variables := "OCCUPATION  (WF-E)"]
all_columns[Varcode == "V11651", Variables := "OCC:3 DIG H-E"]
all_columns[Varcode == "V12014", Variables := "OCC:3 DIG W-E "]

#renamed cols
renamed_cols <- c(renameVars("RELEASE NUMBER", "RELEASE", 68:95),
                  renameVars("SEQUENCE NUMBER", "SEQUENCE NUMBER", 69:95),
                  renameVars("STATE", "STATE", 68:95),
                  renameVars("OCCUPATION HEAD", "OCCUPATION OF HEAD", 68:80),
                  renameVars("OCCUPATION HEAD", "OCC:3DIG\\(H-E\\)", 81:83),
                  renameVars("OCCUPATION HEAD", "OCC:3DIGT", 84),
                  renameVars("OCCUPATION HEAD", "OCC:3 DIG H-E", 85:92),
                  renameVars("OCCUPATION HEAD", "OCCUPATION: 3 DIGIT \\(HD-E\\)", 93:95),
                  renameVars("OCCUPATION WIFE", "OCCUPATION OF WIFE", 68:80),
                  renameVars("OCCUPATION WIFE", "OCCUPATION  \\(WF-E\\)", 81:84),
                  renameVars("OCCUPATION WIFE", "OCC:3 DIG W-E", 85:92),
                  renameVars("OCCUPATION HEAD", "OCCUPATION: 3 DIGIT \\(WF-E\\)", 93:95),
                  renameVars("INDUSTRY HEAD", "INDUSTRY   OF HEAD", 68:80),
                  renameVars("INDUSTRY HEAD", "IND:3 DIGT\\(H-E\\)", 81:92),
                  renameVars("INDUSTRY HEAD", "INDUSTRY: 3 DIGIT \\(HD-E\\)", 93:95),
                  renameVars("INDUSTRY WIFE", "INDUSTRY   OF WIFE", 68:80),
                  renameVars("INDUSTRY WIFE", "INDUSTRY     \\(WF-E\\)", 81:84),
                  renameVars("INDUSTRY WIFE", "MAIN IND:3 DIGT\\(W-E\\)", 85:92),
                  renameVars("INDUSTRY HEAD", "INDUSTRY: 3 DIGIT \\(WF-E\\)", 93:95),
                  renameVars("INDIVIDUAL WEIGHT", "INDIVIDUAL WEIGHT", 68:89),
                  renameVars("INDIVIDUAL WEIGHT", "IND WEIGHT", 90:92),
                  renameVars("FAMILY WEIGHT", "WEIGHT$", 68:92),
                  renameVars("RELATION TO HEAD", "RELATION", 68:95),
                  renameVars("AGE", "AGE OF INDIVIDUAL", 68:95),
                  renameVars("MARITAL PAIRS INDICATORS", "MARR PAIRS", c(68:87, 92)),
                  renameVars("MARITAL PAIRS INDICATORS", "MARITAL INDICATOR-IND", 88:91),
                  renameVars("MARITAL PAIRS INDICATORS", "MARITAL PAIRS", 93:95),
                  renameVars("YEAR MOVED IN/OUT", "YEAR MOVED", 68:95),
                  renameVars("ANNUAL RENT PAYMENT", "RENT P", 68:69),
                  renameVars("ANNUAL RENT PAYMENT", "ANNUAL RENT$", 70:75),
                  renameVars("ANNUAL RENT PAYMENT", "          C12", 76),
                  renameVars("ANNUAL RENT PAYMENT", "ANNUAL RENT 1977", 77),
                  renameVars("ANNUAL RENT PAYMENT", "ANN RENT", 78:87),
                  renameVars("ANNUAL RENT VALUE", "RENT VAL", 68:75),
                  renameVars("ANNUAL RENT VALUE", "IF RENT", 76:87),
                  renameVars("RENT/OWN STATUS", "OWN OR RENT", 68:74),
                  renameVars("RENT/OWN STATUS", "OWN/RENT", 75:89),
                  renameVars("RACE", "RACE", 68:89),
                  renameVars("SEX HEAD", "SEX", 68:89))

renameVarsVarcode <- function(colname, replcodes, range) {
  cols <- paste(colname, range, sep = ".")
  all_columns[Varcode %in% replcodes, NewVarcode:=cols]
  colnames(PSID_raw) <<- as.character(all_columns$NewVarcode)
  cols
}

renamed_cols2 <- c(renameVarsVarcode("FAMILY NUMBER", 
                                     str_split(psid[Y1968 == "V3", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("INTERVIEW NUMBER", 
                                     str_split(psid[Y1968 == "ER30001", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("SPLIT OFF INDICATOR", 
                                     str_split(psid[Y1969 == "V909", final], " ")[[1]],
                                     69:89),
                   renameVarsVarcode("YEAR SPLIT OFF OCCURED", 
                                     str_split(psid[Y1969 == "ER30038", final], " ")[[1]],
                                     69:89),
                   renameVarsVarcode("MAIN SPLITOFF FAMILY NUMBER", 
                                     str_split(psid[Y1969 == "ER30039", final], " ")[[1]],
                                     69:89),
                   renameVarsVarcode("ANNUAL HOURS WORKED HEAD", 
                                     str_split(psid[Y1968 == "V47", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("ANNUAL HOURS WORKED WIFE", 
                                     str_split(psid[Y1968 == "V53", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("LABOR INCOME HEAD", 
                                     str_split(psid[Y1968 == "V74", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("LABOR INCOME WIFE", 
                                     str_split(psid[Y1968 == "V75", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("AGE HEAD", 
                                     str_split(psid[Y1968 == "V117", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("AGE WIFE", 
                                     str_split(psid[Y1968 == "V118", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("MARITAL STATUS", 
                                     str_split(psid[Y1968 == "V239", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("OTHER TRAINING HEAD",
                                     str_split(psid[Y1968 == "V314", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("MOBILITY", 
                                     str_split(psid[Y1968 == "V363", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("CHILDREN COUNT", 
                                     str_split(psid[Y1968 == "V398", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("CHILDREN AGED 1-2 COUNT", 
                                     str_split(psid[Y1975 == "V4207", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("CHILDREN AGED 3-5 COUNT", 
                                     str_split(psid[Y1975 == "V4208", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("CHILDREN AGED 6-13 COUNT", 
                                     str_split(psid[Y1975 == "V4209", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("FEMALE CHILDREN AGED 14-17 COUNT", 
                                     str_split(psid[Y1975 == "V4210", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("FEMALE CHILDREN AGED 18-20 COUNT", 
                                     str_split(psid[Y1975 == "V4212", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("FEMALE CHILDREN AGED 21-29 COUNT", 
                                     str_split(psid[Y1975 == "V4214", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("MALE CHILDREN AGED 14-17 COUNT", 
                                     str_split(psid[Y1975 == "V4211", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("MALE CHILDREN AGED 18-20 COUNT", 
                                     str_split(psid[Y1975 == "V4213", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("MALE CHILDREN AGED 21-29 COUNT", 
                                     str_split(psid[Y1975 == "V4215", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("MOVED SINCE LAST YEAR", 
                                     str_split(psid[Y1969 == "V603", final], " ")[[1]],
                                     69:89),
                   renameVarsVarcode("YEARS WORKED FULL-TIME SINCE 18 WIFE", 
                                     str_split(psid[Y1974 == "V3611", final], " ")[[1]],
                                     74:89),
                   renameVarsVarcode("YEARS WORKED FULL-TIME SINCE 18 HEAD", 
                                     str_split(psid[Y1974 == "V3621", final], " ")[[1]],
                                     74:89),
                   renameVarsVarcode("EDUCATION HEAD", 
                                     str_split(psid[Y1968 == "V313", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("EDUCATION WIFE", 
                                     str_split(psid[Y1968 == "V246", final], " ")[[1]][1],
                                     68),
                   renameVarsVarcode("EDUCATION WIFE", 
                                     str_split(psid[Y1972 == "V2687", final], " ")[[1]][5:22],
                                     72:89),
                   renameVarsVarcode("HOUSEHOLD ALIMONY BRACKET", 
                                     str_split(psid[Y1968 == "V261", final], " ")[[1]],
                                     68:76),
                   renameVarsVarcode("ALIMONY HEAD", 
                                     str_split(psid[Y1978 == "V5793", final], " ")[[1]],
                                     77:89),
                   renameVarsVarcode("HOUSEHOLD ALIMONY",
                                     str_split(psid[Y1970 == "V1215", final], " ")[[1]],
                                     70:76),
                   renameVarsVarcode("ADDITIONAL EDUCATIONAL TRAINING SPOUSE",
                                     str_split(psid[Y1975 == "V4103", final], " ")[[1]],
                                     75:89),
                   renameVarsVarcode("HOUSE VALUE",
                                     str_split(psid[Y1968 == "V5", final], " ")[[1]],
                                     68:89),
                   renameVarsVarcode("LEISURE HOURS",
                                     str_split(psid[Y1968 == "V73", final], " ")[[1]],
                                     68:72),
                   renameVarsVarcode("HOUSEWORK HOURS",
                                     str_split(psid[Y1969 == "ER30029", final], " ")[[1]][str_split(psid[Y1969 == "ER30029", final], " ")[[1]] != ""],
                                     c(69:74, 76:81, 83:86)),
                   renameVarsVarcode("HOUSEHOLD HOUSEWORK HOURS",
                                     str_split(psid[Y1968 == "V59", final], " ")[[1]],
                                     68:74),
                   renameVarsVarcode("HAS DISABILITY",
                                     str_split(psid[Y1969 == "ER30030", final], " ")[[1]][str_split(psid[Y1969 == "ER30030", final], " ")[[1]] != ""],
                                     c(69:72,76:78)),
                   renameVarsVarcode("DISABILITY LIMITING WORK",
                                     str_split(psid[Y1969 == "V745", final], " ")[[1]],
                                     69:71),
                   renameVarsVarcode("DISABILITY LIMITING WORK",
                                     str_split(psid[Y1972 == "V2718", final], " ")[[1]],
                                     72:89),
                   renameVarsVarcode("HOUSEWORK HOURS HEAD",
                                     str_split(psid[Y1969 == "V483", final], " ")[[1]],
                                     69:74),
                   renameVarsVarcode("HOUSEWORK HOURS HEAD",
                                     str_split(psid[Y1976 == "V4350", final], " ")[[1]][str_split(psid[Y1976 == "V4350", final], " ")[[1]] != ""],
                                     c(76:81, 83:89)),
                   renameVarsVarcode("HOUSEWORK HOURS WIFE",
                                     str_split(psid[Y1969 == "V481", final], " ")[[1]],
                                     69:74),
                   renameVarsVarcode("HOUSEWORK HOURS WIFE",
                                     str_split(psid[Y1976 == "V4711", final], " ")[[1]][str_split(psid[Y1976 == "V4711", final], " ")[[1]] != ""],
                                     c(76:81, 83:89)))
#sex, race, wifes education, alimony, heads education, moved, 
PSID_raw_new <- unlabel(PSID_raw)

res <- pivot_longer(PSID_raw_new, 
                    cols=c(renamed_cols, renamed_cols2),
                    names_to = c('.value', 'Year'), 
                    names_sep = '\\.')
res <- data.table(res)

res[, household := unlist(lapply(strsplit(person, "_"), function (x) x[1]))]

#View(head(res[`INDIVIDUAL WEIGHT` != 0, ..c_cols], 1000))
cols <- c("person", "Year", "RELEASE NUMBER", "SEQUENCE NUMBER", "FAMILY NUMBER", "INTERVIEW NUMBER", "RELATION TO HEAD", "MARITAL STATUS", "YEAR MOVED IN/OUT",
          "SPLIT OFF INDICATOR", "YEAR SPLIT OFF OCCURED", "MAIN SPLITOFF FAMILY NUMBER")
c_cols <- c(cols, colnames(res)[colnames(res) %ni% cols])

res_clean <- res[`INDIVIDUAL WEIGHT` != 0, ..c_cols]

#can recode child as NaN, but coded as "child" for now
#all non wife, husband individuals won't have occupation
res_clean[,`OCCUPATION` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                  ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                         ifelse(`RELATION TO HEAD` %in% c(1, 10), `OCCUPATION HEAD`, `OCCUPATION WIFE`),
                                         NaN))]

res_clean[,`INDUSTRY` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                       ifelse(`RELATION TO HEAD` %in% c(1, 10), `INDUSTRY HEAD`, `INDUSTRY WIFE`),
                                       NaN))]
res_clean[,`ANNUAL HOURS WORKED` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                           ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                                  ifelse(`RELATION TO HEAD` %in% c(1, 10), `ANNUAL HOURS WORKED HEAD`, `ANNUAL HOURS WORKED WIFE`),
                                                  NaN))]
res_clean[,`LABOR INCOME` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                    ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                           ifelse(`RELATION TO HEAD` %in% c(1, 10), `LABOR INCOME HEAD`, `LABOR INCOME WIFE`),
                                           NaN))]
res_clean[,`YEARS WORKED FULL-TIME SINCE 18` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                                       ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                                              ifelse(`RELATION TO HEAD` %in% c(1, 10), `YEARS WORKED FULL-TIME SINCE 18 HEAD`, `YEARS WORKED FULL-TIME SINCE 18 WIFE`),
                                                              NaN))]
res_clean[,`EDUCATION` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                 ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                        ifelse(`RELATION TO HEAD` %in% c(1, 10), `EDUCATION HEAD`, `EDUCATION WIFE`),
                                        NaN))]

res_clean[,`HOUSEWORK HOURS` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                                 ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                        ifelse(`RELATION TO HEAD` %in% c(1, 10), `HOUSEWORK HOURS HEAD`, `HOUSEWORK HOURS WIFE`),
                                        NaN))]

res_clean[,`AGE` := ifelse(`RELATION TO HEAD` %in% c(3, 30:39), -1,
                           ifelse(`RELATION TO HEAD` %in% c(1:2, 10, 20), 
                                  ifelse(`RELATION TO HEAD` %in% c(1, 10), `AGE HEAD`, `AGE WIFE`),
                                              NaN))]


res_clean[, haschild := `CHILDREN COUNT` > 0]
res_clean[, wife := `RELATION TO HEAD` == 2 | `RELATION TO HEAD` == 1 & `SEX HEAD` == 2 |
            `RELATION TO HEAD` == 20 | `RELATION TO HEAD` == 10 & `SEX HEAD` == 2]

divorce_dates <- fread("unilateral_divorce_date.csv")
states <- fread("PSIDStateCodes.csv", select = c("PSID_code", "State"))
colnames(divorce_dates)[2:3] <- c("Unilateral Divorce", "Equitable Distribution")
res_clean <- merge.data.table(res_clean, merge.data.table(divorce_dates, states, by = "State"),
                              by.x = "STATE", by.y = "PSID_code")


fwrite(res_clean, "cleaned_psid.csv")
fwrite(all_columns, "documentation.csv")


