library("glmnet")

# on charge les données de train depuis la BDD
train<-read.csv("data_train.csv") # à remplacer par l'input de la BDD

# Imputation des NA : KNN
train<-knnImputation(train,k=5,meth="median")

# Modélisation : Régression logistique LASSO
x <- model.matrix(~.,train[1:24])[,-1]
y <- train[,25]
lasso.model <- cv.glmnet(x,y,family="binomial",alpha=1, type.measure='auc')