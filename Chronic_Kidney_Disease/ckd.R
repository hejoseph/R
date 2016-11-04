library("RWeka")
library("ggplot2")

#Chargement de donnees 
dataCKD <-read.arff(file="chronic_kidney_disease.arff")

df <- as.data.frame(dataCKD)


#Numbers of NA for each column
na_countRows <- colSums(is.na(df))
dfNA_Rows<- as.data.frame(na_countRows)
rownames(dfNA_Rows)

barplot(dfNA_Rows$na_countRows,names.arg=rownames(dfNA_Rows))



#Numbers of NA for each person
na_countCols <-apply(df,1, function(y) sum(is.na(y)))
dfNA_Cols<- as.data.frame(na_countCols)
View(dfNA_Cols)

nums <- sapply(df, is.numeric)
factors <- sapply(df, is.factor)

#test de corrélation entre les variables quantitatives

cor(df[,nums],use="complete")
 
pairs ( df[,nums])



na <- capply(df,2, function(y) sum(is.na(y)))
dfNA <- as.data.frame(na)



