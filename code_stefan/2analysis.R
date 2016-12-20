# Test de corr?lation entre les variables quantitatives

nums <- sapply(df, is.numeric)
cor(df[,nums],use="complete")
pairs ( df[,nums])

# Une autre façon d'afficher le test de corrélation entre les Variables quanti
symnum(cor(df[,nums],use="complete"))

# On donne pour référence notckd = 0, ckd = 1
df$class<-relevel(df$class,ref="notckd")
contrasts(df[,25])