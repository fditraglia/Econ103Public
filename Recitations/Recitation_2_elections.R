#read in data
library(data.table)
URL = paste0('https://raw.githubusercontent.com/tonmcg/',
             'County_Level_Election_Results_12-16/master/',
             'US_County_Level_Presidential_Results_08-16.csv')


counties = fread(URL)
#preview data
counties
names(counties)

#exploring data
## Why FIPS code?
counties[ , .N, by = county]
counties[ , .N, by = county][order(-N)]

#define new variables (%ages)
counties[ , pct_dem_12 := dem_2012/total_2012]
counties[ , pct_rep_12 := gop_2012/total_2012]
counties[ , pct_oth_12 := oth_2012/total_2012]
counties[ , pct_dem_16 := dem_2016/total_2016]
counties[ , pct_rep_16 := gop_2016/total_2016]
counties[ , pct_oth_16 := oth_2016/total_2016]

#compare '12 performance with '16 performance
#First, compare vs 45-degree line
counties[ , {
  plot(pct_dem_12, pct_dem_16, cex = .7,
       xlab = '2012 Democrat Vote Share',
       ylab = '2016 Democrat Vote Share',
       main = 'Predicting 2016 Outcome from 2012 Outcome')
  lines(pct_dem_12, pct_dem_12)
  }]
#Now, include regression fit line
counties[ , {
  plot(pct_dem_12, pct_dem_16, cex = .7,
       xlab = '2012 Democrat Vote Share',
       ylab = '2016 Democrat Vote Share',
       main = 'Predicting 2016 Outcome from 2012 Outcome')
  lines(pct_dem_12, pct_dem_12)
  #Shifted down by ~6%, though overall
  #  Democrat slide was only 2.8%. Why??
  abline(lm(pct_dem_16 ~ pct_dem_12), col = "red", lty = 2)
  }]

#Mean squared error of just using y = x prediction:
counties[ , mean((pct_dem_12 - pct_dem_16)^2)]

#Compare to regression MSE
counties[ , mean(lm(pct_dem_16 ~ pct_dem_12)$residuals^2)]

#what about third parties?
## Relationship between 2012 3rd party vote share and 2016 share
counties[ , {
  plot(pct_oth_12, pct_oth_16,
       xlab = '2012 3rd-Party Vote Share',
       ylab = '2016 3rd-Party Vote Share',
       main = 'Relationship within County of 3rd-Party Vote Share')
  lines(pct_oth_12, pct_oth_12)
  }]

counties[ , barplot(c(
  '2008' = sum(oth_2012)/sum(total_2012),
  '2012' = sum(oth_2012)/sum(total_2012),
  '2016' = sum(oth_2016)/sum(total_2016)),
  col = "orange", xlab = 'Election Year',
  ylab = 'Third-Party Vote Share',
  main = 'Third-Party Performance over Time')]
