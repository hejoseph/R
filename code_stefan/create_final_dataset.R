library("RWeka")

# On importe le dataset
df <-read.arff(file="chronic_kidney_disease.arff")

# On split
limit <- floor(nrow(df)*(0.75))     # definit la repartition train/test en %

df <- df[sample(nrow(df)), ]        # On melange les lignes
train <- df[1:limit, ]              # Dataset de train

test_label <- df[(limit+1):nrow(df), ]    # Dataset de test

test_nolabel<-test_label
test_nolabel$class<-NULL

# On écrit le résultat dans un fichier
write.csv(train, file = "data_train.csv", row.names=F)
write.csv(test_label, file = "data_test_label.csv", row.names=F)
write.csv(test_nolabel, file = "data_test_nolabel.csv", row.names=F)