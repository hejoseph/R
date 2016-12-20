library("glmnet")
library("ROCR")

# R?gression p?nalis?e

x <- model.matrix(~.,train[1:24])[,-1]
y <- train[,25]

# Entrainement du mod?le
model2 <- cv.glmnet(x,y,family="binomial",alpha=1)

coef(model2)

xtest <- model.matrix(~.,test[1:24])[,-1]
res2 <- predict(model2, xtest, type="class")

mean(res2 == test[,25]) # pr?cision

contrasts(test[,25])