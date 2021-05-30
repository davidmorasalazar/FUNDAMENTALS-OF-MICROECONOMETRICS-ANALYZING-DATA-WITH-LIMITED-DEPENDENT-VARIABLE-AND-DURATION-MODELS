*Tercera parte
*Pregunta 1
hist ipcn, percent
tab ipcn if ipcn<100000


*2.1
count if missing(escolari)
tab escolari
drop if escolari==99

*2.2
label list zona a4

recode zona a4 (2=0)
label define zona 0 "rural", modify
label define a4 0 "mujer", modify
label list zona a4
codebook zona a4

*2.3
drop if a5<18

*3
reg ipcn escolari zona a4 a5 i.a6


*4 interpretación en pdf

*5
tobit ipcn escolari zona a4 a5 i.a6, ll(99238) 

*6
margins, predict(e(99238,.)) dydx(_all) atmeans

*7
margins, predict(e(99238,.)) dydx(_all)


