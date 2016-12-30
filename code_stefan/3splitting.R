# Splitting dataset

limit <- floor(nrow(df)*(0.75))      # define % of training and test set

df <- df[sample(nrow(df)), ]        # On m?lange les lignes
train <- df[1:limit, ]              # Dataset de train
test <- df[(limit+1):nrow(df), ]    # Dataset de test