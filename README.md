# ECMA31320
Repo for ECMA 31320 pset and project

### PSETS

Code for all problem sets that required code is in `PSETS` 

### PROJECT

The folder `Project` contains all the code used for our final project. Our final submission is `Final Paper.pdf`

#### Data 

All data used is stored in `Data`. Unless otherwise mentioned, all `.csv` and `.dta` suffix files are in `Data` and all 

Note that you should modify the commands that change directories in the `.R` and `.do` scripts - those are customized to my and my co-author's code. 


 The script `importData.R` prints a list of variable codes that you can request from the PSID data center and `psid_used.csv` which helps map variable codes over time. `psid.csv` is a general codebook obtained from the PSID website. 

- The zipped raw data is `J307180.txt.zip` and should be unzipped
- `J307180_codebook.pdf` is the codebook for the raw data
- `J307180.do` are` J307180_formats.do` format the raw PSID data and should be run in the listed order
- `J307180_formats.do` outputs `Data/PSID.dta`

`cleanData.R` cleans the data and outputs `cleaned_psid.csv` and `documentation.csv` 

`regressions.R` outputs `final_regression_dataset.csv` and produces figures in `Graphics` using Sant'anna-Callaway analysis

`event_study_weights.do`, `treatment_profiles.R` and `deshpande_li.R` produce figures in Graphics using dynamic 2-way fixed effects estimator





