


## ------------------------------------------------------------------------
library(readxl)
library(netmeta)

#Load the data

AcuteManiaP = read_excel("~/_mydrive/Teaching/Kea NMA Course/Practicals/AcuteManiaP.xls")
AcuteManiaP = as.data.frame(AcuteManiaP)
str(AcuteManiaP) 
table(AcuteManiaP$treat2)

## Analysis of the star network comparing antimanic drugs and placebo


Starmeta=metacont(ncont1,mean1,sd1,ncont2,mean2,sd2, data=AcuteManiaP, byvar=treat2, studlab=studlab,sm="SMD",comb.fixed=F)
summary(Starmeta)

treat2.f= factor(AcuteManiaP$treat2)
dummies = model.matrix(~treat2.f)
print(dummies)


Starmeta1=metacont(ncont1,mean1,sd1,ncont2,mean2,sd2, data=AcuteManiaP, studlab=studlab,sm="SMD",comb.fixed=F)
Starmetareg=metareg(Starmeta1,dummies)
summary(Starmetareg)

Starmetareg=metareg(Starmeta1,treat2)


update(Starmeta, tau.common = T)
