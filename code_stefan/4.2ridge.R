library("glmnet")
library("ROCR")

# Régression pénalisée

x <- model.matrix(~.,train[1:24])[,-1]
y <- train[,25]

# Entrainement du modèle
model2 <- cv.glmnet(x,y,family="binomial")

coef(model2)

xtest <- model.matrix(~.,test[1:24])[,-1]
res2 <- predict(model2, xtest, type="class")

mean(res2 == test[,25]) # précision

contrasts(test[,25])