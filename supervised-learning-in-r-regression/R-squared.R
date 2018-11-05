## R Squared

# unemployment is in your workspace
summary(unemployment)

# unemployment_model is in the workspace
summary(unemployment_model)

# Calculate mean female_unemployment: fe_mean. Print it
(fe_mean <- mean(unemployment$female_unemployment))

# Calculate total sum of squares: tss. Print it
(tss <- sum((unemployment$female_unemployment - fe_mean)^2))

# Calculate residual sum of squares: rss. Print it
(rss <- sum((unemployment$residuals)^2))

# Calculate R-squared: rsq. Print it. Is it a good fit?
(rsq <- 1 - rss/tss)

# Get R-squared from glance. Print it
(rsq_glance <- glance(unemployment_model)$r.squared)

# unemployment is in your workspace
summary(unemployment)

# unemployment_model is in the workspace
summary(unemployment_model)

# Get the correlation between the prediction and true outcome: rho and print it
(rho <- cor(unemployment$female_unemployment, unemployment$predictions))

# Square rho: rho2 and print it
(rho2 <- rho^2)

# Get R-squared from glance and print it
(rsq_glance <- glance(unemployment_model)$r.squared)

