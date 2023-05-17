cd "D:\Dissertation\Competition\submission_data"

clear
import delimited using data_101.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1
save data_101, replace


clear
import delimited using data_102.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1 
save data_102, replace


clear
import delimited using data_103.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1 
save data_103, replace



clear
import delimited using data_4.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1
save data_4, replace



clear
import delimited using data_5.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1
save data_5, replace




clear
import delimited using data_6.csv
gen date = tq(2003q1) + _n - 1
format %tq date
drop time
order bank_id date rgdpi rexp rincome unemp rgdp fedfund inflation size commercial concent_re npl_re provision personnel nii_avgass netinc concent_ind dep_dem npl_cc concent_agro concent_cc concent_auto concent_commind dep_core tier1
save data_6, replace
