cd "D:\Dissertation\Competition\submission_data"

clear
import excel stress.xlsx, firstrow
gen date = tq(2003q1) + _n - 1
format %tq date
tsset date
save stress, replace

clear
use stress


// Out-of-sample simulation net income
reg n_netinc l.n_netinc l2.n_netinc l(0/2).d.fedfund l(0/1).d.unemp l(0/1).d.n_tier if date < tq(2021q1)
estat bgodfrey
estat hettest
predict p if date < tq(2021q1)
predict yp if date >= tq(2021q1)
predict s if date >= tq(2021q1), stdf 
generate yp1=yp-1.96*s 
generate yp2=yp+1.96*s 
tsline n_netinc yp yp1 yp2
outreg2 using stress_inc.doc
// Generating dynamic forecasts of performance indicator
arima n_netinc L(1/2).n_netinc, hessian
predict n_netinc_hat, dyn(tq(2023q1))
// Predicting 
reg n_netinc l.n_netinc_hat l2.n_netinc_hat l(0/2).d.fedfund_base l(0/1).d.unemp l(0/1).d.n_tier if date < tq(2021q1), vce(robust)
predict yp_base if date >= tq(2023q1)
reg n_netinc l.n_netinc_hat l2.n_netinc_hat l(0/2).d.fedfund_alt l(0/1).d.unemp l(0/1).d.n_tier if date < tq(2021q1), vce(robust)
predict yp_alt if date >= tq(2023q1)



// Out-of-sample net loss
drop yp1 yp2 yp s p
reg n_netloss l.n_netloss l(0/2).d.fedfund l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2021q1)
estat bgodfrey
estat hettest
predict p if date < tq(2021q1)
predict yp if date >= tq(2021q1)
predict s if date >= tq(2021q1), stdf 
generate yp1=yp-1.96*s 
generate yp2=yp+1.96*s 
tsline n_netloss yp yp1 yp2
outreg2 using stress_loss.doc
// ARIMA
arima n_netloss L(1/2).n_netloss, hessian
predict n_netloss_hat, dyn(tq(2023q1))
// Pred
drop yp_base yp_alt
reg n_netloss_hat l.n_netloss_hat l(0/2).d.fedfund_base l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2023q1), vce(robust)
predict yp_base if date >= tq(2023q1)
reg n_netloss_hat l.n_netloss_hat l(0/2).d.fedfund_alt l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2023q1), vce(robust)
predict yp_alt if date >= tq(2023q1)



// Out-of-sample NPL
drop yp1 yp2 yp s p
reg n_npl l.n_npl l(0/2).d.fedfund l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2021q1)
estat bgodfrey
estat hettest
predict p if date < tq(2021q1)
predict yp if date >= tq(2021q1)
predict s if date >= tq(2021q1), stdf 
generate yp1=yp-1.96*s 
generate yp2=yp+1.96*s 
tsline n_npl yp yp1 yp2
outreg2 using stress_npl.doc
// ARIMA
arima n_npl L(1/2).n_npl, hessian
predict n_npl_hat, dyn(tq(2023q1))
// Pred
drop yp_base yp_alt
reg n_npl l.n_npl_hat l(0/2).d.fedfund_base l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2023q1), vce(robust)
predict yp_base if date >= tq(2023q1)
reg n_npl l.n_npl_hat l(0/2).d.fedfund_alt l(0/1).d.rgdp l(0/1).d.unemp l(0/1).d.n_tier l(0/1).d.n_coredep if date < tq(2023q1), vce(robust)
predict yp_alt if date >= tq(2023q1)
