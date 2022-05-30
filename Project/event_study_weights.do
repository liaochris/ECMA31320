* Plot event study weights using Abraham and Sun's package 
clear all
graph set window fontface Times
graph set eps fontface Times

cd "/Users/noahsobel-lewin/Dropbox/ECMA31320/Project"

* import data
import delimited "Data/final_regression_dataset.csv", clear 

* keep relevant variables
keep id age annualhoursworked year unilateraldivorceyear ///
equitabledistributionyear equitabledistribution houseworkhours state worked

* cleanup worked
gen worked_real = worked == "TRUE"
drop worked 
rename worked_real worked 
  
* code relative year variable
rename unilateraldivorceyear uni_only_year
gen uni_work_year = uni_only_year * worked

tempfile full
save `full'

* iterate over treatments 
foreach type in only work {
	
	use `full', clear 
	
	* make output folder
	cap: shell rm -rd "Graphics/weight_plots_`type'"
	shell mkdir "Graphics/weight_plots_`type'"
		
		
	* generate relative year variable
	gen ry_uni_`type' = year - uni_`type'_year if uni_`type'_year != 0 

	* generate groups
	foreach group in -5 -4 -3 -2 0 1 2 3 4 5 6 7 8 9 10 {
	if `group' < 0 {
		local p_group = -`group' 
		gen g_uni_`type'_`p_group' = ry_uni_`type' == `group'
	}
	else{
		gen g_uni_`type'`group' = ry_uni_`type' == `group'
	}
}
	* compute weights 
	eventstudyweights g_uni_`type'*, absorb(i.id i.year) ///
	cohort(uni_`type'_year) rel_time(ry_uni_`type') ///
	saveweights("Weights/uni_`type'_weights.xlsx")
	
	* produce figures 
	import excel "Weights/uni_`type'_weights.xlsx", clear firstrow
			
	* iterate over relative years 
	foreach ry in -4 -3 -2 0 1 3 5 7{
		
		* define convenient locals 
		local ry_p = abs(`ry')
		if `ry' < 0 local g_var g_uni_`type'_`ry_p'
		else local g_var g_uni_`type'`ry_p'
		
		preserve
		
		* keep lead/lag of interest 
		if `ry' < 0 keep `g_var' uni_`type'_year ry_uni_`type'
		else keep `g_var' uni_`type'_year ry_uni_`type'
	
		* sum weights of cohort avergaed in that lead/lag
		collapse (sum) w_sum = `g_var', by(ry_uni_`type')
		
		* plot graph 
		twoway ///
		(bar w_sum ry_uni_`type' if ry_uni_`type' < `ry' ,  fcolor(white) lcolor(red)) ///
		(bar w_sum ry_uni_`type' if ry_uni_`type' == `ry' ,  fcolor(white) lcolor(black)) ///
		(bar w_sum ry_uni_`type' if ry_uni_`type' > `ry' ,  fcolor(white) lcolor(blue)) ///
		, graphregion(color(white)) scheme(s1mono) legend(off) ///
		ytitle("Weight", size(large)) xtitle("Relative Year", size(large)) ///
		note("Relative year of coefficient: `ry'." ///
		"Red (blue) bars are weights from relative years before (after) the" ///
		"relative year associated with the lead or lag coefficient." ///
		, size(large))
		
		* save graphs
		if `ry' < 0 graph export "Graphics/weight_plots_`type'/weights_`type'_ry_`ry_p'.png", replace
		else graph export "Graphics/weight_plots_`type'/weights_`type'_ry`ry_p'.png", replace
		
		restore 
	
	}
	
	
}

