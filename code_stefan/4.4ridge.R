library("glmnet")
library("pROC")
library("caret")

# R?gression p?nalis?e

x <- model.matrix(~.,train[1:24])[,-1]
y <- train[,25]

# Entrainement du mod?le
ridge.model <- cv.glmnet(x,y,family="binomial",alpha=0,type.measure = 'auc', intercept=FALSE)

# Le lambda a été choisi avec la meilleure AUC
plot(ridge.model)

# Coef obtenus
coef(ridge.model)

# Calcul des probas
xtest <- model.matrix(~.,test[1:24])[,-1]
ridge.prob <- predict(ridge.model, xtest, type="class", s="lambda.min")

# Précision du modèle
mean(ridge.prob == test[,25])

# Calculons la coube ROC
ridge.prob <- predict(ridge.model, xtest, type="response", s="lambda.min")
test$ridge.prob <- ridge.prob

ridge.roc <- roc(class ~ ridge.prob, data = test)
plot(ridge.roc)