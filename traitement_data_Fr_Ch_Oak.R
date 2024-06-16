####################################################################################################################################
################################################### TRAITENEMENTS DES DONNEES ######################################################
####################################################################################################################################

# Chemin d'accès
setwd("C:/Users/Nono/Desktop/Univ Lorraine/Projet TUT/R/2024_Projet_tuteure_Noemie_Kuczynski")

# Ouverture données 
#library(readr)
#Donnes_France_X_Chine_2001_2020 <- read_delim("Donnes_France_X_Chine_2001_2020.csv", 
                                           #   delim = ";", escape_double = FALSE, trim_ws = TRUE)
Donnes_France_X_Chine_2001_2020 <- read.csv("Donnes_France_X_Chine_2001_2020.csv", sep = ";", stringsAsFactors = T)
str(Donnes_France_X_Chine_2001_2020)

#Donnes_China_M_France_2001_2020 <- read_delim("Donnes_China_M_France_2001_2020.csv", 
 #                                             delim = ";", escape_double = FALSE, trim_ws = TRUE)
Donnes_China_M_France_2001_2020 <- read.csv("Donnes_China_M_France_2001_2020.csv", sep = ";", stringsAsFactors = T)
str(Donnes_China_M_France_2001_2020)

#Exploration des donnees 
str(Donnes_China_M_France_2001_2020)
summary(Donnes_China_M_France_2001_2020)
#legacyEstimationFlag et primaryvalue sont en int mais je peux quand même avec des médiannes, min, max,...
# Mais il manque 2002 

########################## Changer les colonnes avec l'argent dedans
#Changer le noms des colonnes ciblées 
library(dplyr)
#elongation_long <- rename(elongation_long, zone = Zone, indiv = Indiv, year = Year, length = Length)
Donnes_China_M_France_2001_2020 <- rename(Donnes_China_M_France_2001_2020, Value = primaryValue )
Donnes_France_X_Chine_2001_2020 <- rename(Donnes_France_X_Chine_2001_2020,Value = legacyEstimationFlag )

# Supprimer la colonne "colonne_a_supprimer"
#df <- subset(df, select = -colonne_a_supprimer)
Donnes_China_M_France_2001_2020 <- subset(Donnes_China_M_France_2001_2020, select = -legacyEstimationFlag)
Donnes_France_X_Chine_2001_2020 <- subset(Donnes_France_X_Chine_2001_2020, select = -primaryValue)





###############################################
###### Transformet la colonne des années en facteur
#Donnes_China_M_France_2001_2020$Year <- as.factor(Donnes_China_M_France_2001_2020$Year)
#str(Donnes_China_M_France_2001_2020)
#Les annees sont des factors 

###############################################
# PB : il manque une annee 2002 pour les donnes vennant de la chine 
# Solution : ajouter une ligne avec juste l'année 2002 pour la colonne Année mais il faut que les données soit quand même en num 

###### Ajouter l'année 2002 aux imports de la Chine 
#Ligne_2002 <- c("2002",156, "China","M",251,"France","H","","FALSE","", "","" , 0, "","" )
#Donnes_China_M_France_2001_2020_av2002 <- rbind(Donnes_China_M_France_2001_2020, Ligne_2002)
#L'ajout de la ligne est nullos parce qu'elle est que en chr 

# Nouvelle tentative
#Donnes_China_M_France_2001_2020_av2002 <- rbind(Donnes_China_M_France_2001_2020, c(2002,156, "China","M",251,"France","H","","FALSE","", "","" , 0, "","" ))
#str(Donnes_China_M_France_2001_2020_av2002)
#Toujours en chr 

# Ajouter une nouvelle ligne avec un élément de type factor
library(dplyr)
Ligne_2002_V2 <- data.frame(Year = as.integer("2002"),
                            reporterCode = as.integer("156"),
                            reporterName = "China",
                            flowCode = "M",
                            partenerCode = as.integer("251"),
                            partenerName = "France",
                            classificationCode = "H",
                            cifValue = as.integer("0"),
                            fobValue = as.logical("FALSE") ,
                            Value = 0,
                            isReported = 0,
                            isAgregate = as.integer("0"),
                            NA...14 = as.logical("FALSE"),
                            NA...15 = as.logical("FALSE") )
colnames(Ligne_2002_V2) = colnames(Donnes_China_M_France_2001_2020)
length(rownames(Ligne_2002_V2))
str(Ligne_2002_V2)
Donnes_China_M_France_2001_2020_av2002_V3 <- rbind(Donnes_China_M_France_2001_2020, Ligne_2002_V2)
str(Donnes_China_M_France_2001_2020_av2002_V3)
#Le nouveau tableau est validé, j'ai bien toutes les années pour l'importation de la Chine
#int pour Year

#Test barplot 
barplot(Donnes_China_M_France_2001_2020_av2002_V3$Value~Donnes_China_M_France_2001_2020_av2002_V3$Year)
#test validé, on peut passer aux choses sérieuses

##############################################################################
####USELESS 
#Donnes_China_M_France_2001_2020_av2002_V3 <- bind_rows(Donnes_China_M_France_2001_2020_av2002, Ligne_2002_V2)
#Je peux pas combine parce que qu'il y a un character et un double pour la colonne reporerCode
#str(Donnes_China_M_France_2001_2020_av2002_V3)

###### Ordonner et bien vérifier que les données monétaires soient en num et les années en factor ? 
#as.factor( Donnes_China_M_France_2001_2020_av2002$Year)
#as.numeric(Donnes_China_M_France_2001_2020_av2002$primaryValue)
#str(Donnes_China_M_France_2001_2020)
#str(Donnes_China_M_France_2001_2020_av2002)

#Index <- order(Donnes_China_M_France_2001_2020_av2002_V3$Year)
# order(Df$nom_colonne1, decreasing=FALSE)
# Index = liste de l'ordre dans laquelle il faut mettre les lignes de Donnees_China_..._av2002_V3
#Donnes_China_M_France_2001_2020_av2002_V3 <- data[Index, ]
########################################################################

# Ordonner les années 
#library(dplyr)
# noramelement déjà ouvert 
Donnes_China_M_France_2001_2020_av2002_V3_order <- arrange(Donnes_China_M_France_2001_2020_av2002_V3, Year)


###### Création d'un tableau qui regroupe les deux tables 
str(Donnes_China_M_France_2001_2020_av2002_V3_order)
str(Donnes_France_X_Chine_2001_2020)
Donnes_Fr_Ch_mix_2001_2020 <- bind_rows(Donnes_France_X_Chine_2001_2020, Donnes_China_M_France_2001_2020_av2002_V3_order)
#nouveau tableau bien créé 


# Ordonner les années de ce superbe tableau 
#library(dplyr)
# noramelement déjà ouvert 
Donnes_Fr_Ch_mix_2001_2020_order <- arrange(Donnes_Fr_Ch_mix_2001_2020, Year)
#c'est cool ça 
#Value est en num

##################################################
#Exportation des données 
write.table(Donnes_Fr_Ch_mix_2001_2020_order, "Data_Fr_Ch_combine_2001_2020.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 


########################################################################################################################
############################# TRAITEMENT DES DONNEES POUR LES PARTENAIRES ##############################################
########################################################################################################################

Donnes_China_partenaires <- read.csv("Donnes_China_partenaires.csv", sep = ";", stringsAsFactors = T)
str(Donnes_China_partenaires)

Donnes_France_partenaires <- read.csv("Donnes_France_partenaires.csv", sep = ";", stringsAsFactors = T)
str(Donnes_France_partenaires)
Donnes_France_partenaires$legacyEstimationFlag <- as.integer(Donnes_France_partenaires$legacyEstimationFlag)
str(Donnes_France_partenaires)

#Avoir un tableau avec chaque partenaires qui apparait une fois 
#partenerName 
#table(Donnes_China_partenaires$partenerName)
#table(Donnes_France_partenaires$partenerName)

#Donnees_Slovakie <-  subset(Donnes_China_partenaires, partenerName == "USA")

library(dplyr)
# Faire la somme des valeurs pour chaque partenaires

Partenaires_Chine <- aggregate(Donnes_China_partenaires$primaryValue, list(Donnes_China_partenaires$partenerName),FUN= sum)

Partenaires_France <- aggregate(Donnes_France_partenaires$legacyEstimationFlag, list(Donnes_France_partenaires$partenerName),FUN= sum)
str(Partenaires_France)


################################################
#Exportation des données 
write.table(Partenaires_France, "Partenaires_France.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 

#Exportation des données 
write.table(Partenaires_Chine, "Partenaires_Chine.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 


##############
#quesls sont les plus gros pays partenaires de la Chine 
Partenaires_Chine <- arrange(Partenaires_Chine, desc(x))
head(Partenaires_Chine)
#Le Top 5 des partenaires de la Chine : Russie, USA, France, Allemagne et Belgique 

#Gros partenaires de la France 
Partenaires_France <- arrange(Partenaires_France, desc(x))
head(Partenaires_France)
#Le Top 5 des partenaires de la France : Chine, Belgique, Allemagne, Italie, Espagne 

#Sélection des partenaires en gardant que les plus gros 
# nouveau_pib <- pib[pib$Pays %in% c("France", "Suisse"), ]
Selection_Partenaires_Chine <- Donnes_China_partenaires [Donnes_China_partenaires$partenerName %in% c("France", "Russian Federation", "USA", "Germany", "Belgium"),]

Selection_Partenaires_Chine_2 <- Donnes_China_partenaires [Donnes_China_partenaires$partenerName %in% c("France", "Russian Federation", "USA", "Germany"),]

#Sélection des partenaires en gardant que les plus gros 
Selection_Partenaires_France <- Donnes_France_partenaires [Donnes_France_partenaires$partenerName %in% c("China", "Germany", "Belgium", "Spain","Italy"),]

Selection_Partenaires_France_SC <- Donnes_France_partenaires [Donnes_France_partenaires$partenerName %in% c("Germany", "Belgium", "Spain","Italy"),]
sum(Selection_Partenaires_France_SC$legacyEstimationFlag)
# somme entre 2001 et 2020 de la sélection : 571491074

#############################################
#Creation d'un data frame sans World 
Donnees_Partenaires_Chine_SW <- Donnes_China_partenaires[Donnes_China_partenaires$partenerName != "World", ]
summary(Donnees_Partenaires_Chine_SW)
sum(Donnees_Partenaires_Chine_SW$primaryValue)
# 4 089 427 942

Donnees_Partenaires_France_SW <- Donnes_France_partenaires[Donnes_France_partenaires$partenerName != "World", ]
summary(Donnees_Partenaires_France_SW)
sum(Donnees_Partenaires_France_SW$legacyEstimationFlag)
# 1281648509 : somme entre 2001 et 2020 de tous les partenaires 

###############################################
#Proportion 
summary(Selection_Partenaires_Chine)
sum(Selection_Partenaires_Chine$primaryValue)
# 3 736 460 980
sum(Selection_Partenaires_Chine_2$primaryValue) # sans la belgique
# 3 503 523 185

summary(Selection_Partenaires_France)
sum(Selection_Partenaires_France$legacyEstimationFlag)
# 928 235 982


##########CHINE 

##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2005 
Donnes_China_Partenaires_2005 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2005", ]
sum(Donnes_China_Partenaires_2005$primaryValue)
# Total des importations de la Chine en 2015 : 201 228 933
# France : 


##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2008 
Donnes_China_Partenaires_2008 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2008", ]
sum(Donnes_China_Partenaires_2008$primaryValue)
# Total des importations de la Chine en 2008 : 240 950 088
# Russie 174 000 000

##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2010 
Donnes_China_Partenaires_2010 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2010", ]
sum(Donnes_China_Partenaires_2010$primaryValue)
# Total des importations de la Chine en 2010 : 144 583 726
# France : 23 000 000

##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2015 
Donnes_China_Partenaires_2015 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2015", ]
sum(Donnes_China_Partenaires_2015$primaryValue)
# Total des importations de la Chine en 2015 : 260 763 984
# France : 84 000 000

##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2017
Donnes_China_Partenaires_2017 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2017", ]
sum(Donnes_China_Partenaires_2017$primaryValue)
# Total des importations de la Chine en 2018 : 398 766 074
# 

##############################################
# Creation d'un data frame pour les imports de la Chine pour seulement l'année 2018
Donnes_China_Partenaires_2018 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2018", ]
sum(Donnes_China_Partenaires_2018$primaryValue)
# Total des importations de la Chine en 2018 : 433 849 150
# France : 134 000 000 

##############################################
# Creation d'un data frame pour les imports de la Chine avec que la Russie et seulement entre 2009 et 2020
Donnes_China_Partenaires_Russia <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$partenerName == "Russian Federation", ]
Donnes_China_Partenaires_Russia_2009_2020 <- Donnes_China_Partenaires_Russia[Donnes_China_Partenaires_Russia$Year %in% c("2009", "2010", "2011", "2012","2013", "2014", "2015", "2016","2017","2018","2019","2020"),]
summary(Donnes_China_Partenaires_Russia_2009_2020$primaryValue)
#Moyenne : 49 242 799


####################################################################################
########### Annnes 
Donnees_Partenaires_Chine_SW_2009 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2009", ]
sum(Donnees_Partenaires_Chine_SW_2009$primaryValue)
# 100 344 532

Donnees_Partenaires_Chine_SW_2010 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2010", ]
sum(Donnees_Partenaires_Chine_SW_2010$primaryValue)
# 144 583 726

Donnees_Partenaires_Chine_SW_2011 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2011", ]
sum(Donnees_Partenaires_Chine_SW_2011$primaryValue)
# 180 511 215

Donnees_Partenaires_Chine_SW_2011 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2011", ]
sum(Donnees_Partenaires_Chine_SW_2011$primaryValue)
# 180 511 215

Donnees_Partenaires_Chine_SW_2012 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2012", ]
sum(Donnees_Partenaires_Chine_SW_2012$primaryValue)
# 125 228 370

Donnees_Partenaires_Chine_SW_2013 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2013", ]
sum(Donnees_Partenaires_Chine_SW_2013$primaryValue)
# 154 592 918

Donnees_Partenaires_Chine_SW_2014 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2014", ]
sum(Donnees_Partenaires_Chine_SW_2014$primaryValue)
# 272 550 128

Donnees_Partenaires_Chine_SW_2015 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2015", ]
sum(Donnees_Partenaires_Chine_SW_2015$primaryValue)
# 260 763 984

Donnees_Partenaires_Chine_SW_2016 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2016", ]
sum(Donnees_Partenaires_Chine_SW_2016$primaryValue)
# 253 053 407

Donnees_Partenaires_Chine_SW_2017 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2017", ]
sum(Donnees_Partenaires_Chine_SW_2017$primaryValue)
# 398 766 074

Donnees_Partenaires_Chine_SW_2018 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2018", ]
sum(Donnees_Partenaires_Chine_SW_2018$primaryValue)
# 433 849 150

Donnees_Partenaires_Chine_SW_2019 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2019", ]
sum(Donnees_Partenaires_Chine_SW_2019$primaryValue)
# 312 540 242

Donnees_Partenaires_Chine_SW_2020 <- Donnees_Partenaires_Chine_SW[Donnees_Partenaires_Chine_SW$Year == "2020", ]
sum(Donnees_Partenaires_Chine_SW_2020$primaryValue)
# 341 942 484

mean(c(341942484,312540242,433849150,398766074,253053407,260763984,272550128,154592918, 125228370, 180511215,144583726,100344532))
# 248 227 186 en moyenne des imports mondiaux de la Chine 

######## FRANCE
##############################################
# Creation d'un data frame pour les exports de la France pour seulement l'année 2011
Donnes_France_partenaires_2011 <- Donnees_Partenaires_France_SW[Donnees_Partenaires_France_SW$Year == "2011", ]
sum(Donnes_France_partenaires_2011$legacyEstimationFlag)
# Total des importations de la Chine en 2017 : 66 195 939
# CHINE : 

##############################################
# Creation d'un data frame pour les exports de la France pour seulement l'année 2018
Donnes_France_partenaires_2018 <- Donnees_Partenaires_France_SW[Donnees_Partenaires_France_SW$Year == "2018", ]
sum(Donnes_France_partenaires_2018$legacyEstimationFlag)
# Total des exportations de la France en 2018 : 122 061 808
# part de la CHINE : 57 863 680

################################################################################################################################
#Exportation des données 
write.table(Selection_Partenaires_France, "Selection_Partenaires_France.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 

#Exportation des données 
write.table(Selection_Partenaires_Chine, "Selection_Partenaires_Chine.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 

#Exportation des données 
write.table(Selection_Partenaires_Chine_2, "Selection_Partenaires_Chine_2.csv",sep = ";", row.names = FALSE)
#Fichier csv bien créé 



###################################################################################################################################
###################################################################################################################################
###################################################################################################################################
#Création graphiques 
plot(Donnes_France_X_Chine_2001_2020$Value)
barplot(Donnes_France_X_Chine_2001_2020$Value)
barplot(Donnes_France_X_Chine_2001_2020$Value, 
        ylab = "Valeurs des exportations ($)", xlab = "Années",
        main = "Exportations du bois ronds de Chênes français vers la Chine", sub = "Entre 2001 et 2020",
        col= "bisque",col.main="tomato", col.lab="black", col.sub="slategrey",
        cex.main=1.1, cex.lab=0.9, cex.sub=1.1)

barplot(Donnes_China_M_France_2001_2020$Value, 
        ylab = "Valeurs des importations ($)", xlab = "Années",
        main = "Importations du bois ronds de Chênes français vers la Chine", sub = "Entre 2001 et 2020",
        col= "lavender",   col.main="red", col.lab="blue", col.sub="black")

# Changer les échelles et faire apparaitre les années 
# Mettre les légendes à la même taille et mettre des couleurs harmonieuses 
#utiliser ggplot2 


#################################################################################################################################
#################################################################################################################################
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


###############################################################################################################################################################
################################################################################################################################################################
######## Sous-tableaux 
Donnees_Partenaires_Chine_SW
Donnees_Partenaires_France_SW


###################################################################################
#Creation d'un data frame avec que USA
USA <- Donnes_China_partenaires[Donnes_China_partenaires$partenerName == "USA", ]

#Sélection des années
USA_2001_2007 <- USA [USA$Year %in% c("2001", "2002", "2003", "2004","2005", "2006","2007"),]

sum(USA_2001_2007$primaryValue)
# 130 198 356

# garder que les années pour le monde 
Monde_2001_2007 <- Donnees_Partenaires_Chine_SW [Donnees_Partenaires_Chine_SW$Year %in% c("2001", "2002", "2003", "2004","2005", "2006","2007"),]
sum(Monde_2001_2007$primaryValue)
# 869 751 624
#############################################


###################################################################################
#Creation d'un data frame avec que Belgique
Bel <- Donnes_China_partenaires[Donnes_China_partenaires$partenerName == "Belgium", ]

sum(Bel$primaryValue)
# 232 937 795

# garder que les années pour le monde 
sum(Donnees_Partenaires_Chine_SW$primaryValue)
# 4 089 427 942
#############################################

###################################################################################
#Creation d'un data frame avec que Belgique
Bel2 <- Donnees_Partenaires_France_SW[Donnees_Partenaires_France_SW$partenerName == "Belgium", ]

sum(Bel2$legacyEstimationFlag)
# 239 210 370

# garder que les années pour le monde 
sum(Donnees_Partenaires_France_SW$legacyEstimationFlag)
# 1 281 648 509
#############################################

###################################################################################
#Creation d'un data frame avec que Chine
Chine <- Donnees_Partenaires_France_SW[Donnees_Partenaires_France_SW$partenerName %in% c("China"), ]

#Sélection des années
Chine_2001_2009 <- Chine [Chine$Year %in% c("2001", "2002", "2003", "2004","2005", "2006","2007","2008","2009"),]

sum(Chine_2001_2009$legacyEstimationFlag)
# 23 671 381 avec Hong Kong et 19 842 468 sans 

# Calcul de l'augmentation des valeurs par an
Chine_2001_2009$Augmentation <- c(NA, diff(Chine_2001_2009$legacyEstimationFlag)) # Calcul de la différence entre les valeurs d'une année à l'autre
# Calcul de la moyenne de l'augmentation des valeurs par an
moyenne_augmentation <- mean(Chine_2001_2009$Augmentation, na.rm = TRUE)
# 460 000 -> en pourcentage 46% 

# Calculer le taux de croissance annuel moyen en pourcentage - V2 
mean_growth_rate <- (Chine_2001_2009$legacyEstimationFlag[length(Chine_2001_2009$legacyEstimationFlag)] / Chine_2001_2009$legacyEstimationFlag[1])^(1/(length(Chine_2001_2009$legacyEstimationFlag) - 1)) - 1
mean_growth_rate_percentage <- mean_growth_rate * 100

# garder que les années pour le monde 
Monde_2001_2009 <- Donnees_Partenaires_France_SW [Donnees_Partenaires_France_SW$Year %in% c("2001", "2002", "2003", "2004","2005", "2006","2007","2008","2009"),]
sum(Monde_2001_2009$legacyEstimationFlag)
# 411 020 847
#############################################

###################################################################################
#Sélection des années
Chine_2013_2017 <- Chine [Chine$Year %in% c("2013", "2014", "2015", "2016","2017"),]

sum(Chine_2013_2017$legacyEstimationFlag)
# 149 098 412

# garder que les années pour le monde 
Monde_2013_2017 <- Donnees_Partenaires_France_SW [Donnees_Partenaires_France_SW$Year %in% c("2013", "2014", "2015", "2016","2017"),]
sum(Monde_2013_2017$legacyEstimationFlag)
# 375 697 904
#############################################
