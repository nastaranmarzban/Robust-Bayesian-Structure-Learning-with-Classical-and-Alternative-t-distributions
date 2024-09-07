
library(fitdistrplus)
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# We want to produce numbers from standard normal
n <- 1000
mean <- 0
sd <- 1

  
data <- rnorm(n, mean, sd)

# Add outliers
outliers1 <- c(rnorm(10, mean = 3, sd = 0.5))
outliers2 <- c(rnorm(10, mean = -3, sd = 0.5))

# standard normal with added outliers(complete data)
data_with_outliers <- c(data, outliers1, outliers2)

# Plot histogram and boxplot of the complete data
hist(data_with_outliers, breaks = 50, main = "Histogram of Data with Outliers", xlab = "Value", col = "lightblue")
boxplot(data, col = "yellow")

# Fit normal distribution
fit_normal <- fitdist(data_with_outliers, "norm")

# Fit t-distribution
fit_t <- fitdist(data_with_outliers, "t", start = list(df = 5))

summary(fit_normal)
summary(fit_t)



# Q-Q plot comparison
qqcomp(list(fit_normal, fit_t), legendtext = c("Normal Distribution", "t Distribution"))



