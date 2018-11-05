## Transformations & Relative Error

# fdata is in the workspace
summary(fdata)

# Examine the data: generate the summaries for the groups large and small:
fdata %>% 
        group_by(label) %>%     # group by small/large purchases
        summarize(min  = min(y),   # min of y
                  mean = mean(y),   # mean of y
                  max  = max(y))   # max of y

# Fill in the blanks to add error columns
fdata2 <- fdata %>% 
        group_by(label) %>%       # group by label
        mutate(residual = pred - y,  # Residual
               relerr   = residual / y)  # Relative error

# Compare the rmse and rmse.rel of the large and small groups:
fdata2 %>% 
        group_by(label) %>% 
        summarize(rmse     = sqrt(mean(residual^2)),   # RMSE
                  rmse.rel = sqrt(mean(((residual)/y)^2)))   # Root mean squared relative error

# Plot the predictions for both groups of purchases
ggplot(fdata2, aes(x = pred, y = y, color = label)) + 
        geom_point() + 
        geom_abline() + 
        facet_wrap(~ label, ncol = 1, scales = "free") + 
        ggtitle("Outcome vs prediction")

## Log transformations

# Examine Income2005 in the training set
summary(income_train$Income2005)

# Write the formula for log income as a function of the tests and print it
(fmla.log <- formula(log(Income2005) ~ Arith + Word + Parag + Math + AFQT))

# Fit the linear model
model.log <-  lm(data = income_train, formula = fmla.log)

# Make predictions on income_test
income_test$logpred <- predict(object = model.log, newdata = income_test)
summary(income_test$logpred)

# Convert the predictions to monetary units
income_test$pred.income <- exp(income_test$logpred)
summary(income_test$pred.income)

#  Plot predicted income (x axis) vs income
ggplot(data = income_test, aes(x = pred.income, y = Income2005)) + 
        geom_point() + 
        geom_abline(color = "blue")

# fmla.abs is in the workspace
fmla.abs

# model.abs is in the workspace
summary(model.abs)

# Add predictions to the test set
income_test <- income_test %>%
        mutate(pred.absmodel = predict(model.abs, income_test),        # predictions from model.abs
               pred.logmodel = exp(predict(model.log, income_test)))   # predictions from model.log

# Gather the predictions and calculate residuals and relative error
income_long <- income_test %>% 
        gather(key = modeltype, value = pred, pred.absmodel, pred.logmodel) %>%
        mutate(residual = pred - Income2005,   # residuals
               relerr   = residual / Income2005)   # relative error

# Calculate RMSE and relative RMSE and compare
income_long %>% 
        group_by(modeltype) %>%      # group by modeltype
        summarize(rmse     = sqrt(mean(residual^2)),    # RMSE
                  rmse.rel = sqrt(mean(((relerr^2)))))    # Root mean squared relative error

# houseprice is in the workspace
summary(houseprice)

# Create the formula for price as a function of squared size
(fmla_sqr <- formula(price ~ I(size^2)))

# Fit a model of price as a function of squared size (use fmla_sqr)
model_sqr <- lm(data = houseprice, formula = fmla_sqr)

# Fit a model of price as a linear function of size
model_lin <- lm(price ~ size, data = houseprice)

# Make predictions and compare
houseprice %>% 
        mutate(pred_lin = predict(object = model_lin),       # predictions from linear model
               pred_sqr = predict(object = model_sqr)) %>%   # predictions from quadratic model 
        gather(key = modeltype, value = pred, pred_lin, pred_sqr) %>% # gather the predictions
        ggplot(aes(x = size)) + 
        geom_point(aes(y = price)) +                   # actual prices
        geom_line(aes(y = pred, color = modeltype)) + # the predictions
        scale_color_brewer(palette = "Dark2")

# houseprice is in the workspace
summary(houseprice)

# fmla_sqr is in the workspace
fmla_sqr

# Create a splitting plan for 3-fold cross validation
set.seed(34245)  # set the seed for reproducibility
splitPlan <- kWayCrossValidation(nrow(houseprice), 3, NULL, NULL)

# Sample code: get cross-val predictions for price ~ size
houseprice$pred_lin <- 0  # initialize the prediction vector
for(i in 1:3) {
        split <- splitPlan[[i]]
        model_lin <- lm(price ~ size, data = houseprice[split$train,])
        houseprice$pred_lin[split$app] <- predict(model_lin, newdata = houseprice[split$app,])
}

# Get cross-val predictions for price as a function of size^2 (use fmla_sqr)
houseprice$pred_sqr <- 0 # initialize the prediction vector
for(i in 1:3) {
        split <- splitPlan[[i]]
        model_sqr <- lm(formula = fmla_sqr, data = houseprice[split$train, ])
        houseprice$pred_sqr[split$app] <- predict(model_sqr, newdata = houseprice[split$app, ])
}

# Gather the predictions and calculate the residuals
houseprice_long <- houseprice %>%
        gather(key = modeltype, value = pred, pred_lin, pred_sqr) %>%
        mutate(residuals = pred - price)

# Compare the cross-validated RMSE for the two models
houseprice_long %>% 
        group_by(modeltype) %>% # group by modeltype
        summarize(rmse = sqrt(mean(residuals^2)))