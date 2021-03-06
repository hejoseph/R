
# Cr�ation du mod�le
library("pscl")


set.seed(123)
library(randomForest)


# Entrainement du mod�le de r�gression logistique
model <- glm(class ~ .,family=binomial(link='logit'),data=train,maxit=300)
# D�viance r�siduelle quasiment nulle, AIC tr�s bas... Etrange
summary(model)
anova(model,test="Chisq")

# Nous obtenons un pseudo R2 de McFadden TRES �lev� ! Etrange
pR2(model)
# McFadden nous dit qu'un seuil convenable se situe entre 0.2 et 0.4 (r�gle du pouce)

res <- predict(model, newdata=test[,-25],type='response') # On fait les pr�dictions sur les tests
res <- ifelse(res > 0.5,"nockd","ckd") # On d�termine un seuil pour classifier

# Le taux de pr�cision
misClasificError <- mean(res != test[,25])
print(paste('Accuracy',1-misClasificError))