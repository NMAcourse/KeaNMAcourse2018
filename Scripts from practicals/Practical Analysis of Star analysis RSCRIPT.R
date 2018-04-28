## ------------------------------------------------------------------------
library(meta)
library(readxl)

## ------------------------------------------------------------------------
#Load the data
Star = read_excel("~/_mydrive/Teaching/Kea NMA Course/Practicals/Star.xls")
View(Star) 
table(Star$contrast)

## ------------------------------------------------------------------------
# meta-analyses by comparison subgroup analysis
Starmeta=metacont(ncont1,mean1,sd1,ncont2,mean2,sd2, data=Star, byvar=contrast, studlab=author,sm="SMD",comb.fixed=F)
summary(Starmeta)


#meta-regression
Starmeta1=metacont(ncont1,mean1,sd1,ncont2,mean2,sd2, data=Star, studlab=author,sm="SMD",comb.fixed=F)
Starmetareg=metareg(Starmeta1,contrast)
summary(Starmetareg)

## ------------------------------------------------------------------------
#subgroup analysis with common tau
update(Starmeta, tau.common = T)
