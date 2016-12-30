library("RWeka")
library("ggplot2")
library("DMwR")
library("MASS")
library("mice")
library("VIM")
library("ade4")

# Chargement de donn??es 
dataCKD <-read.arff(file="chronic_kidney_disease.arff")

# Copie du dataframe original
df <- as.data.frame(dataCKD)

#Affichage en pourcentage la frequence des valeurs manquantes pour chaque variable
pMiss <- function(x){sum(is.na(x))/length(x)*100}
apply(df,2,pMiss)
dfMV<-as.data.frame(md.pattern(df)) 


# Histogramme et Pattern pour les valeurs manquantes
aggr_plot <- aggr(df, col=c('darkgreen','red'), numbers=TRUE, sortVars=TRUE, labels=names(df), cex.axis=.7, gap=3, ylab=c("Histogramme de valeus manquantes","Pattern"))


# Nombre de NA par colonne
na_countRows <- colSums(is.na(df))
dfNA_Rows<- as.data.frame(na_countRows)

barplot(dfNA_Rows$na_countRows,names.arg=rownames(dfNA_Rows))

# on remarque qu'on a peu de valeurs manquantes pour les donnC)es qualitatives en comparaison avec les donnC)es quantitatives


# Nombre de NA par individu
na_countCols <-apply(df,1, function(y) sum(is.na(y)))
dfNA_Cols<- as.data.frame(na_countCols)
dfNA_Cols


# Histogramme pour chacune des variables quantitatives

drawHist<- function(df, nCols){
  for(iCol in colnames(df[,nCols]))
    truehist(df[,iCol],xlab=iCol)
}

# drawHist(df,nums)

# Observations avec des valeurs manquantes de type factor
factor <- sapply(df, is.factor)
sum(is.na(df[,factor]))
df[rowSums(is.na(df))>5,factor]


# Méthode de suppression des invidivus qui ont 40 % de MV
# manyNAs(df,0.4)
# df <- df[-manyNAs(df,0.4),]

# Imputation FAMD
df<-knnImputation(df,k=5,meth="median")