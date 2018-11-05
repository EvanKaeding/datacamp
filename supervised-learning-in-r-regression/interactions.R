# Interactions

# alcohol is in the workspace
summary(alcohol)

# Create the formula with main effects only
(fmla_add <- formula(Metabol ~ Gastric + Sex))

# Create the formula with interactions
(fmla_interaction <- formula(Metabol ~ Gastric:Sex + Gastric))

# Fit the main effects only model
model_add <- lm(data = alcohol, formula = fmla_add)

# Fit the interaction model
model_interaction <- lm(data = alcohol, formula = fmla_interaction)

# Call summary on both models and compare
summary(model_add)
summary(model_interaction)

# Computer RMSE with Cross Validation Across multiple model variants

# alcohol is in the workspace
summary(alcohol)

# Both the formulae are in the workspace
fmla_add
fmla_interaction

# Create the splitting plan for 3-fold cross validation
set.seed(34245)  # set the seed for reproducibility
splitPlan <- kWayCrossValidation(nrow(alcohol), nSplits = 3, NULL, NULL)

# Sample code: Get cross-val predictions for main-effects only model
alcohol$pred_add <- 0  # initialize the prediction vector
for(i in 1:3) {
        split <- splitPlan[[i]]
        model_add <- lm(fmla_add, data = alcohol[split$train, ])
        alcohol$pred_add[split$app] <- predict(model_add, newdata = alcohol[split$app, ])
}

# Get the cross-val predictions for the model with interactions
alcohol$pred_interaction <- 0 # initialize the prediction vector
for(i in 1:3) {
        split <- splitPlan[[i]]
        model_interaction <- lm(fmla_interaction, data = alcohol[split$train, ])
        alcohol$pred_interaction[split$app] <- predict(model_interaction, newdata = alcohol[split$app, ])
}

# Get RMSE
alcohol %>% 
        gather(key = modeltype, value = pred, pred_add, pred_interaction) %>%
        mutate(residuals = Metabol - pred) %>%      
        group_by(modeltype) %>%
        summarize(rmse = sqrt(mean(residuals^2)))