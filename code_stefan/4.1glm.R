
# Création du modèle
library("pscl")


set.seed(123)
library(randomForest)


# Entrainement du modèle de régression logistique
model <- glm(class ~ .,family=binomial(link='logit'),data=train,maxit=300)
# Déviance résiduelle quasiment nulle, AIC très bas... Etrange
summary(model)
anova(model,test="Chisq")

# Nous obtenons un pseudo R2 de McFadden TRES élevé ! Etrange
pR2(model)
# McFadden nous dit qu'un seuil convenable se situe entre 0.2 et 0.4 (règle du pouce)

res <- predict(model, newdata=test[,-25],type='response') # On fait les prédictions sur les tests
res <- ifelse(res > 0.5,"nockd","ckd") # On détermine un seuil pour classifier

# Le taux de précision
misClasificError <- mean(res != test[,25])
print(paste('Accuracy',1-misClasificError))