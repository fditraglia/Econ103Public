xbar_z_score <- function(n, mu, sigma){
  sim_data <- rnorm(n, mean = mu, sd = sigma)
  x_bar <- mean(sim_data)
  SE <- sigma / sqrt(n)
  out <- (x_bar - mu) / SE
  return(out)
}

xbar_z_score_est <- function(n, mu, sigma){
  sim_data <- rnorm(n, mean = mu, sd = sigma)
  x_bar <- mean(sim_data)
  SE_est <- sd(sim_data) / sqrt(n)
  out <- (x_bar - mu) / SE_est
  return(out)
}

set.seed(1234)
z <- replicate(50000, xbar_z_score(5, 0, 1))
set.seed(1234)
z_est <- replicate(50000, xbar_z_score_est(5, 0, 1))

#x_min <- min(min(z), min(z_est))
#x_max <- max(max(z), max(z_est))
x_min <- -5
x_max <- 5
x_seq <- seq(x_min, x_max, length.out = 1001)
y_max <- dnorm(0) * 1.2

par(mfrow = c(1, 2))
MASS::truehist(z, xlab = '', main = expression(sqrt(n)(bar(x) - mu)/ sigma),
               xlim = c(x_min, x_max), ylim = c(0, y_max))
points(x_seq, dnorm(x_seq), type = 'l', lwd = '3', col = 'red')
abline(v = quantile(z, 0.025), lty = 2, lwd = 2)
abline(v = quantile(z, 0.975), lty = 2, lwd = 2)
text(0, y_max * 0.95, 'Middle 95%')
MASS::truehist(z_est, xlab = '', main = expression(sqrt(n)(bar(x) - mu)/ S),
               xlim = c(x_min, x_max), ylim = c(0, y_max))
points(x_seq, dnorm(x_seq), type = 'l', lwd = '3', col = 'red')
abline(v = quantile(z_est, 0.025), lty = 2, lwd = 2)
abline(v = quantile(z_est, 0.975), lty = 2, lwd = 2)
text(0, y_max * 0.95, 'Middle 95%')
par(mfrow = c(1, 1))

