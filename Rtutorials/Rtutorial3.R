## ----fread_select--------------------------------------------------------
library(data.table)
survey = fread("http://www.ditraglia.com/econ103/old_survey.csv",
               select = c("handedness", "height", "handspan"))

## ----cor_use-------------------------------------------------------------
survey[ , cor(handspan, height, use = "complete.obs")]

## ----cor_isna------------------------------------------------------------
survey[!is.na(handspan) & !is.na(height), cor(handspan, height)]

## ----cor_dt--------------------------------------------------------------
cor(survey, use = "complete.obs")
#alternatively, there's the na.omit
#  function, which does just what it says:
cor(na.omit(survey))

## ----find_missing--------------------------------------------------------
survey[is.na(handedness) & !is.na(height) & !is.na(handspan)]

## ----cov-----------------------------------------------------------------
survey[ , cov(handspan, height, use = "complete.obs")]
cov(survey, use = "complete.obs")
cov(na.omit(survey))

## ----lm------------------------------------------------------------------
survey[ , lm(height ~ handspan)]

## ----lm_rev--------------------------------------------------------------
survey[ , lm(handspan ~ height)]

## ----plot_formula, results = 'hide'--------------------------------------
survey[ , plot(handspan ~ height)]

## ----abline_lm, results = 'hide'-----------------------------------------
survey[ , plot(handspan ~ height)]
survey[ , abline(lm(handspan ~ height))]

## ----abline_samplemean, results = 'hide'---------------------------------
survey[ , {
  plot(handspan ~ height)
  abline(lm(handspan ~ height))
  abline(v = mean(height, na.rm = TRUE),
         h = mean(handspan, na.rm = TRUE),
         col = 'red', lty = 2)
}]

## ----abline_ab, results = 'hide'-----------------------------------------
x = seq(from = 0, to = 1, by = 0.1)
y = x^2
plot(y ~ x)
abline(a = 0, b = 1)

## ----function_write------------------------------------------------------
z.score = function(x){
  z = (x - mean(x, na.rm = TRUE))/sd(x, na.rm = TRUE)
  return(z)
}

## ----mymean--------------------------------------------------------------
mymean = function(x){
  x = x[!is.na(x)]
  x.bar = sum(x)/length(x)
  return(x.bar)
}

## ----mean_builtin--------------------------------------------------------
mean(survey$height, na.rm = TRUE)

## ----mymean_test---------------------------------------------------------
mymean(survey$height)

## ----mymean2-------------------------------------------------------------
mymean2 = function(x){
  x.bar = sum(x, na.rm = TRUE)/length(x)
  return(x.bar)
}
mymean2(survey$height)

## ----myvar---------------------------------------------------------------
myvar = function(x){
  x = x[!is.na(x)]
  s.squared = sum((x-mymean(x))^2)/(length(x) - 1)
  return(s.squared)
}

## ----myvar_test----------------------------------------------------------
var(survey$handspan, na.rm = TRUE)
myvar(survey$handspan)

## ----function_return_data.table------------------------------------------
summary.stats = function(x){
  x = x[!is.na(x)]
  sample.mean = mean(x)
  std.dev  = sd(x)
  out = data.table(sample.mean, std.dev)
  return(out)
}
results = summary.stats(survey$handedness)
results
results$sample.mean
results$std.dev

## ----mycov---------------------------------------------------------------
mycov = function(x, y){
  
  keep = !is.na(x) & !is.na(y)
  x = x[keep]
  y = y[keep]
  
  n = length(x)
  
  s.xy = sum( (x - mean(x)) * (y - mean(y)) ) / (n-1)
  return(s.xy)
}

## ----mycov_test----------------------------------------------------------
survey[ , cov(handspan, handedness, use = "complete.obs")]
survey[ , mycov(handspan, handedness)]

## ----install.packages_both, eval = FALSE---------------------------------
## install.packages(c("Quandl", "zoo"))

## ----libray_quandl_zoo---------------------------------------------------
library(Quandl)
library(zoo)

## ----load_apple----------------------------------------------------------
apple.prices = Quandl('GOOG/NASDAQ_AAPL', start_date = '2016-01-01', end_date = '2016-12-31', type = 'zoo')

## ----head_apple----------------------------------------------------------
head(apple.prices)

## ----plot_apple----------------------------------------------------------
plot(apple.prices)

## ----plot_closing--------------------------------------------------------
plot(apple.prices$Close, main = 'Daily Closing Prices: Apple Computer - 2016',
     xlab = 'Date', ylab = 'Price', lwd = 3)

## ----diff----------------------------------------------------------------
foo = c(1,2,4,7,11)
diff(foo)

## ----log_returns---------------------------------------------------------
apple.returns = diff(log(apple.prices$Close))

## ----plot_log_returns----------------------------------------------------
plot(apple.returns, main = 'Apple Computer - 2016',
     xlab = 'Date', ylab = 'Log Daily Returns', 
     col = 'blue', lwd = 3)

## ----average_return------------------------------------------------------
mean(apple.returns)

## ----sd_return-----------------------------------------------------------
sd(apple.returns)

## ----as_pct--------------------------------------------------------------
mean(apple.returns) * 100
sd(apple.returns) * 100

## ----cum_return----------------------------------------------------------
sum(apple.returns)

## ----skewed_returns------------------------------------------------------
hist(apple.returns) 
mean(apple.returns)
median(apple.returns)

## ----log_vs_x------------------------------------------------------------
x = seq(-.9, .9, length.out = 100)
plot(x, log(1 + x), lwd = 3L, type = 'l', col = "blue",
     xlab = "x", ylab = "y", main = "Comparing x and log(1+x)")
abline(v = 0, h = 0)
lines(x, x, lwd = 2L, lty = 2L, col = "red")

## ----log_vs_x_zoom-------------------------------------------------------
x = seq(-.05, .05, length.out = 100)
plot(x, log(1 + x), lwd = 3L, type = 'l', col = "blue",
     xlab = "x", ylab = "y", main = "Comparing x and log(1+x)")
abline(v = 0, h = 0)
lines(x, x, lwd = 2L, lty = 2L, col = "red")

