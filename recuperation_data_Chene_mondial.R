##############################################################################################################################
################################################### EXTRACTION DES DONNEES ###################################################
##############################################################################################################################

# Chemin d'accès
setwd("C:/Users/Nono/Desktop/Univ Lorraine/Projet TUT/R/2024_Projet_tuteure_Noemie_Kuczynski")

# Ouverture données 
library(readr)
uncomtrade_data <- read_csv("un_comtrade_data/raw_data/uncomtrade_data.csv")
View(uncomtrade_data)


##########################################################################################################################
############# Données des exportations et importations du chêne (code HS : 440391) entre 2001 et 2020  ###################


#############################################################################
##### Verification du contenus des colonnes et des colonnes à supprimer #####
table(uncomtrade_data$typeCode)
#Type Code = C pour toutes les données 
# à supprimier 

table(uncomtrade_data$freqCode)
#Freq Code = A pour toutes les données 
# à supprimier 

table(uncomtrade_data$refPeriodId)
#ref Period Id = 1er janvier de toutes années 
# à supprimier 

table(uncomtrade_data$refYear)
# Année => à garder 

table(uncomtrade_data$refMonth)
# Numéro du mois = 52 pour toutes les données 
# à supprimer 

table(uncomtrade_data$period)
#Années 
# à supprimier 

############## changement de tableau
table(Data_Monde_Oak_20$isOriginalClassification)
#Classification originale = True pour toutes les données 
# à supprimer 
table(Data_Monde_Oak_20$cmdCode)
# 440391 : Pour toutes les données 
table(Data_Monde_Oak_20$cmdDesc)
# Wood; oak, in the rough, whether or not stripped of bark or sapwood, or roughly squared, untreated : pour toutes les données 
table(Data_Monde_Oak_20$aggrLevel)
#Agri level = 6 pour toutes les données 
table(Data_Monde_Oak_20$isLeaf)
#Is Leaf True pour toutes les données 
table(Data_Monde_Oak_20$customsCode)
#Custom code = C00 pour toutes les données 
table(Data_Monde_Oak_20$customsDesc)
# TOTAL CPC pour toutes les données 
table(Data_Monde_Oak_20$mosCode)
# O pour toutes les données 
table(Data_Monde_Oak_20$motCode)
#O pour toutes les données 
table(Data_Monde_Oak_20$motDesc)
#TOTAL MOT pour toutes les données 

table(Data_Monde_Oak_20$legacyEstimationFlag)




##########################################################################
#################### Suppression des colones inutiles ####################
#Suppression de la 6éme colonne et création d'un nouveau tableau sans cette colonne
# Nom1_sous_R<-Df [,-6]
Data_Monde_Oak_20 <- uncomtrade_data [,-c(1,2,3,5,6,15,16,17,19)]

Data_Monde_Oak_20 <- Data_Monde_Oak_20 [,-c(3,8,11,12,13,14,15,16,17,18)]

#Suppression des colonnes qui concernent le poids 
Data_Monde_Oak_20 <- Data_Monde_Oak_20 [,-c(9,10,11,12,13,14,15,16,17,18,19,20)]
Data_Monde_Oak_20 <- Data_Monde_Oak_20 [,-5]




########################################################################
################## Renomer les colonnes pertinantes ####################
#Changer toutes les colones 
#names(Df)<-c(“x”,”y”)
names(Data_Monde_Oak_20) <- c("Year","reporterCode","reporterName","flowCode","partenerCode","partenerName","classificationCode","cifValue","fobValue","primaryValue","legacyEstimationFlag","isReported","isAgregate")

#Changer une colone ciblée 
#library(dplyr)
#elongation_long <- rename(elongation_long, zone = Zone, indiv = Indiv, year = Year, length = Length)



#################################################################################
##### Tri des données pour garder que ce qui concerne la France et la Chine #####

#Mydata[which(Mydata$couleur_fav_simpl=="azur")
#Data_FrCh_Oak_20 <- Data_Monde_Oak_20[which(Data_Monde_Oak_20)]

#elong_subset <- filter(elongation_long, zone %in% c(2, 3), year %in% c("X2009", "X2010", "X2011"))
library(dplyr)
#Data_FrCh_Oak_20 <- filter(Data_Monde_Oak_20, reporterName %in% "France")
#nouveau_tableau <- subset(data, categorie == "A")
Data_Fr_Oak_20 <- subset(Data_Monde_Oak_20, reporterName == "France")
Data_FrX_Oak_20 <- subset(Data_Fr_Oak_20, flowCode == "X")
Data_FrXCh_Oak_20 <- subset(Data_FrX_Oak_20,partenerName == "China")


########################################################################
########################## Export des données ##########################
#Exporter des données au format csv
#write.table(Df, « Nom_du_fichier.csv »,sep = « ; », row.names = FALSE)
#write.csv(nouveau_tableau, file = "nouveau_tableau.csv", row.names = FALSE)

write.table(Data_FrXCh_Oak_20, "Donnes_France_X_Chine_2001_2020.csv",sep = ";", row.names = FALSE)


#########################################################################
######################## Donnees mirroirs ###############################
Data_Ch_Oak_20 <- subset(Data_Monde_Oak_20, reporterName == "China")
Data_ChM_Oak_20 <- subset(Data_Ch_Oak_20, flowCode == "M")
Data_ChMFr_Oak_20 <- subset(Data_ChM_Oak_20,partenerName == "France")
#il manque l'annee 2002

#Exportation des données
write.table(Data_ChMFr_Oak_20, "Donnes_China_M_France_2001_2020.csv",sep = ";", row.names = FALSE)

#### BLablaou test test 1 2 3 
