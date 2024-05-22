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
# Mais il manque 2002 


###############################################
# PB : il manque une annee 2002 pour les donnes vennant de la chine 
# Solution : ajouter une ligne avec juste l'année 2002 pour la colonne Année mais il faut que les données soit quand même en num 

###### Ajouter l'année 2002 aux imports de la Chine 
Ligne_2002 <- c("2002",156, "China","M",251,"France","H","","FALSE","", "","" , 0, "","" )
Donnes_China_M_France_2001_2020_av2002 <- rbind(Donnes_China_M_France_2001_2020, Ligne_2002)

###### Ordonner et bien vérifier que les données monétaires soient en num et les années en factor ? 
Donnes_China_M_France_2001_2020_av2002 <- is.factor( Donnes_China_M_France_2001_2020_av2002$Year)
str(Donnes_China_M_France_2001_2020_av2002)

Index <- order(Donnes_China_M_France_2001_2020_av2002$Year)
# c'est l'ordre dans laquelle il faut mettre les lignes du Data China av 2002
Donnes_China_M_France_2001_2020_av2002 <- data [Index, ]



##############################################
#Création graphiques 
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


################################################################################################
#### Création d'un nouveau graphique avec les imports et exports







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

