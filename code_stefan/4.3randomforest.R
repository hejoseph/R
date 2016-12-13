# Entrainement du modèle random forest
model3 <- randomForest(class ~ ., data = train, ntree=5000, mtry=6)

# Avec random forest
res3<-predict(model3,data=test[,-25])

plot(model3)
summary(model3)

model3$predicted

mean(res3 == test[,25])