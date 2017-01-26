#read in data
library(data.table)
URL = paste0('https://raw.githubusercontent.com/tonmcg/',
             'County_Level_Election_Results_12-16/master/',
             'US_County_Level_Presidential_Results_08-16.csv')


counties = fread(URL)
#preview data
counties

#define new variables (%ages)
counties[ , pct_dem_12 := dem_2012/total_2012]
counties[ , pct_rep_12 := gop_2012/total_2012]
counties[ , pct_oth_12 := oth_2012/total_2012]
counties[ , pct_dem_16 := dem_2016/total_2016]
counties[ , pct_rep_16 := gop_2016/total_2016]
counties[ , pct_oth_16 := oth_2016/total_2016]

#compare '12 performance with '16 performance
counties[ , {
  plot(pct_dem_12, pct_dem_16)
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
counties[ , plot(pct_oth_12, pct_oth_16)]
