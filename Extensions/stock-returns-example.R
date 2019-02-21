prices <- read.csv('http://ditraglia.com/econ103/closing_prices.csv')
head(prices)

google_returns <- diff(log(prices$GOOG))
apple_returns <- diff(log(prices$APPL))
s1 <- sd(google_returns)
s2 <- sd(apple_returns)
r <- cor(google_returns, apple_returns)

wstar <- (s2^2 - r * s1 * s2) / (s1^2 + s2^2 - 2 * r * s1 * s2)
  
