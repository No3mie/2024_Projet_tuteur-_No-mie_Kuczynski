##############################################################################################################################
################################################### ANALYSE DES DONNEES ######################################################
##############################################################################################################################

# Chemin d'accès
setwd("C:/Users/Nono/Desktop/Univ Lorraine/Projet TUT/R/2024_Projet_tuteure_Noemie_Kuczynski")

# Ouverture données 
library(readr)
Donnes_France_X_Chine_2001_2020 <- read_delim("Donnes_France_X_Chine_2001_2020.csv", 
                                              delim = ";", escape_double = FALSE, trim_ws = TRUE)

Donnes_China_M_France_2001_2020 <- read_delim("Donnes_China_M_France_2001_2020.csv", 
                                              delim = ";", escape_double = FALSE, trim_ws = TRUE)


#Exploration des donnees 
str(Donnes_France_X_Chine_2001_2020)
#legacyEstimationFlag est bien en num
str(Donnes_China_M_France_2001_2020)
# primaryValue est num 

plot(Donnes_France_X_Chine_2001_2020$legacyEstimationFlag)
barplot(Donnes_France_X_Chine_2001_2020$legacyEstimationFlag)
barplot(Donnes_France_X_Chine_2001_2020$legacyEstimationFlag, 
        ylab = "Valeurs des exportations ($)", xlab = "Années",
        main = "Exportations du bois ronds de Chênes français vers la Chine", sub = "Entre 2001 et 2020",
        col= "bisque",col.main="tomato", col.lab="black", col.sub="slategrey",
        cex.main=1.1, cex.lab=0.9, cex.sub=1.1)

barplot(Donnes_China_M_France_2001_2020$primaryValue, 
        ylab = "Valeurs des importations ($)", xlab = "Années",
        main = "Importations du bois ronds de Chênes français vers la Chine", sub = "Entre 2001 et 2020",
        col= "lavender",   col.main="red", col.lab="blue", col.sub="black")

# Changer les échelles et faire apparâitre les années 
# Bien caser les titres sur 2 lignes 