cd "D:\Dissertation\Competition\submission_data"
clear

append using data_101 data_102 data_103 data_4 data_5 data_6

xtset bank_id date 
order bank_id date size commercial netinc npl_re npl_cc concent_re concent_ind concent_agro concent_cc concent_auto ///
      concent_commind dep_dem  dep_core tier1 provision personnel nii_avgass rgdpi rexp rincome unemp rgdp fedfund inflation  
save panel, replace  



clear
use panel 

xtunitroot llc npl_cc, lags(aic 4)

xtunitroot llc personnel, lags(aic 4)

xtunitroot llc netinc, lags(aic 4) 

xtunitroot llc tier1, lags(aic 4)

xtunitroot llc provision, lags(aic 4) 

xtunitroot llc nii_avgass, lags(aic 4)

xtunitroot llc concent_cc, lags(aic 4)

xtunitroot hadri netinc, kernel(bartlett 4) demean

bysort bank_id: corr netinc d.fedfund


xtabond netinc l(0/2).d.fedfund l(0/1).nii_avgass l(0/2).rgdp l(0/1).provision l(0/1).d.unemp, lags(1)
outreg2 using panel_netinc.doc
estat sargan
predict res, e
pnorm res

xtabond npl_cc l(0/2).d.fedfund l(0/2).d.unemp l(0/2).rgdp l(0/2).nii_avgass l(0/2).provision, lags(1)
outreg2 using panel_npl.doc
estat sargan
predict re, e
pnorm re


xtabond personnel l(0/2).d.fedfund l(0/2).d.unemp l(0/2).rgdp l(0/2).nii_avgass l(0/2).provision, lags(1)
outreg2 using panel_personnel.doc
estat sargan
predict resid, e
pnorm resid
