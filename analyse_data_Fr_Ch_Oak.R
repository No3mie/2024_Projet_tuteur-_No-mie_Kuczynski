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

# Changer les échelles et faire apparaitre les années 
# Mettre les légendes à la même taille et mettre des couleurs harmonieuses 
#utiliser ggplot2 

###############################################################################################
###### Ajouter l'année 2002 aux imports de la Chine 
nouvelle_ligne <- c("2002",156, "China","M",251,"France","H","","FALSE","", "","" , 0, "","" )
tableau <- rbind(Donnes_China_M_France_2001_2020, nouvelle_ligne)

################################################################################################
#### Création d'un nouveau graphique avec les imports et exports

# chargement package
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Création du data frame
time <- Donnes_France_X_Chine_2001_2020$Year
valeurs_imports_chine <- tableau$primaryValue
valeurs_exports_france <- Donnes_France_X_Chine_2001_2020$legacyEstimationFlag
# 
compil_donnees <- data.frame(time, valeurs_imports_chine, valeurs_exports_france)
# A refaire, les chiffres sont dans le mauvais ordre

# Conversion de la colonne 'temps' en format Date
compil_donnees$time <- as.Date(compli_donnees$time)

# Créer le graphique barplot
#ggplot(data, aes(temps, fill = factor(variable))) +
#  geom_bar(position = "dodge", stat = "identity") +
#  labs(x = "Temps", y = "Valeurs", fill = "Catégorie") +
#  ggtitle("Comparaison de deux catégories en fonction du temps")

#####################################################
####Jointure de table 
#library('dplyr')

# Methode 1 
#export = data[(data$flowCode == "X"),]
#import = data[(data$flowCode == "M"),]
#mirror_flow = full_join(export[c("cmdCode","period","reporterDesc","partnerDesc","primaryValue")], 
                    #    import[c("cmdCode","period","reporterDesc","partnerDesc","primaryValue")], 
                    #   by=c("cmdCode", "period", "reporterDesc"="partnerDesc", "partnerDesc"="reporterDesc"))

#Methode 2 
#mirror_flow = merge(x= export[c("cmdCode","period","reporterDesc","partnerDesc","primaryValue")],
               #     y= import[c("cmdCode","period","reporterDesc","partnerDesc","primaryValue")],
                #    by.x=c("cmdCode", "period", "reporterDesc", "partnerDesc"),
                 #   by.y=c("cmdCode", "period", "partnerDesc", "reporterDesc"),
                  #  all.x = TRUE, all.y = TRUE)


#toMatch = c('\\d','XX','_X')
#data[!(grepl(paste(toMatch,collapse="|"), data$reporterISO)) &
 #      !(grepl(paste(toMatch,collapse="|"), data$partnerISO)),]

