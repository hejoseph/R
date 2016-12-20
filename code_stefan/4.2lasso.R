library("glmnet")
library("pROC")
library("caret")
library("caTools")

# R?gression p?nalis?e

x <- model.matrix(~.,train[1:24])[,-1]
y <- train[,25]

# Entrainement du mod?le
lasso.model <- cv.glmnet(x,y,family="binomial",alpha=1,type.measure = 'auc', intercept=FALSE)

# Le lambda a été choisi avec la meilleure AUC
plot(lasso.model)

# Coef obtenus
coef(lasso.model)

# Calcul des probas
xtest <- model.matrix(~.,test[1:24])[,-1]
lasso.prob <- predict(lasso.model, xtest, type="class", s="lambda.min")

# Précision du modèle
mean(lasso.prob == test[,25])

# Calculons la coube ROC
lasso.prob <- predict(lasso.model, xtest, type="response", s="lambda.min")
test$lasso.prob <- lasso.prob