# Splitting dataset

#install.packages("caret")
#library("caret")

limit <- floor(nrow(df)*(0.80))      # define % of training and test set

df <- df[sample(nrow(df)), ]        # On mélange les lignes
train <- df[1:limit, ]              # Dataset de train
test <- df[(limit+1):nrow(df), ]    # Dataset de test