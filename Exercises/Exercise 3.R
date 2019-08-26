# Build a linear regression model

mod1 = lm(Hc ~ Hg, data = datos_male)
summary(mod1)


# Histogram of the residuals

hist(mod1$residuals)

# Plot the regression model using ggplot
library(tidyverse)
ggplot(datos_male, aes (x = Hg, y = Hc)) + 
  geom_point() + geom_smooth(method = "lm") +
  ggtitle("Simple regression model")


# Split the dataset, and test it (using fun modelling package)

library(funModeling)
idx <- get_sample(datos_male, percentage_tr_rows = 0.70)
train_data <- datos_male[idx,]
test_data <- datos_male[-idx,]

# Create model

mod2 = lm(Hc ~ Hg, data = train_data)
summary(mod2)

predict <- predict(mod2, test_data)

# Get actual and predicted
act_pred <- data.frame(cbind(actuals = test_data$Hc, predicted = predict))
cor(act_pred)


mape <- mean(abs((act_pred$predicted - act_pred$actuals))/act_pred$actuals)
print(mape) # show the result

# Testing autocorrelation and heteroskedasticity

library(lmtest)
bptest(mod2)
resettest(mod2)
dwtest(mod2)
bgtest(mod2)

# Robust standard errors
library(AER)
coeftest(mod2)
coeftest(mod2, vcov = vcovHC)
# Diagnostic plots

plot(mod2)

