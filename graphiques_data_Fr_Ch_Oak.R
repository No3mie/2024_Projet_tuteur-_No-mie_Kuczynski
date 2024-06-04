####################################################################################################################################
######################################################### CREATION GRAPHIQUES ######################################################
####################################################################################################################################

# Chemin d'accès
setwd("C:/Users/Nono/Desktop/Univ Lorraine/Projet TUT/R/2024_Projet_tuteure_Noemie_Kuczynski")

# Ouverture données 
Data_Fr_Ch_combine_2001_2020 <- read.csv("Data_Fr_Ch_combine_2001_2020.csv", sep = ";", stringsAsFactors = T)
str(Data_Fr_Ch_combine_2001_2020)

#Partenaires_France <- read.csv("Partenaires_France.csv", sep = ";", stringsAsFactors = T)

#Partenaires_Chine <- read.csv("Partenaires_Chine.csv", sep = ";", stringsAsFactors = T)

Selection_Partenaires_France <- read.csv("Selection_Partenaires_France.csv", sep = ";", stringsAsFactors = T)

Selection_Partenaires_Chine <- read.csv("Selection_Partenaires_Chine.csv", sep = ";", stringsAsFactors = T)
#######################################################################################################################################
# Création d'un graphique avec la chronologie des imports et exports ($)

# library
library(ggplot2)

ggplot(Data_Fr_Ch_combine_2001_2020, aes(fill=partenerName, y=Value, x=Year)) + 
  geom_bar(position="dodge", stat="identity")+
  scale_fill_manual(values = c("tomato", "cornflowerblue"))+
  ggtitle(
    "Montant des flux commerciaux entre la Chine et la France",
    subtitle = "Entre 2001 et 2020"
  ) 


################################################################################################################################
#Creation d'un lineplot avec les partenaires de la france et de la chine 


# Make the plot
#ggplot(data=nom_data, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type)) + 
  #geom_line() + 
 # geom_ribbon(alpha=0.5) + 
#  scale_x_log10() + 
  #scale_y_log10() + 
 # xlab(as.expression(expression( paste("Radius (", R[500], ")") ))) + 
#  ylab("Scaled Temperature")
library(ggplot2)

ggplot(data=Selection_Partenaires_France, aes(x=Year, y=legacyEstimationFlag, fill=partenerName, linetype=partenerName)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = legacyEstimationFlag - sd(legacyEstimationFlag), 
                  ymax = legacyEstimationFlag + sd(legacyEstimationFlag)), 
              alpha=0.5) + 
  xlab("pouet") + 
  ylab("Scaled Temperature")

#Deuxième Version 

ggplot(Selection_Partenaires_France, aes(x = Year, y = legacyEstimationFlag, group = partenerName, color = partenerName)) +
  geom_line() +
  geom_ribbon(aes(ymin = legacyEstimationFlag - sd(legacyEstimationFlag), 
                  ymax = legacyEstimationFlag + sd(legacyEstimationFlag)), 
              alpha = 0.2) +
  labs(title = "Line chart with error envelope",
       x = "Year",
       y = "Legacy Estimation Flag") +
  theme_minimal()


#Partenaires de la Chine 
ggplot(data=Selection_Partenaires_Chine, aes(x=Year, y=primaryValue, fill=partenerName, linetype=partenerName)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = primaryValue - sd(primaryValue), 
                  ymax = primaryValue + sd(primaryValue)), 
              alpha=0.5) + 
  xlab("Années") + 
  ylab("Valeurs des exports")

####################################################################################################################################
#######################################################################################################################################
# Création d'un graphique des proportions des pays qui exportent à la chine 

# load library
#library(ggplot2)

# Create test data.
# data <- data.frame(category=c("A", "B", "C"),count=c(10, 60, 30))

# Compute percentages
# data$fraction = data$count / sum(data$count)
#Partenaires_Chine$fraction <- Partenaires_Chine$x / sum(Partenaires_Chine$x)

# Compute the cumulative percentages (top of each rectangle)
# data$ymax = cumsum(data$fraction)
#Partenaires_Chine$ymax <- cumsum(Partenaires_Chine$fraction)

# Compute the bottom of each rectangle
# data$ymin = c(0, head(data$ymax, n=-1))
#Partenaires_Chine$ymin = c(0, head(Partenaires_Chine$ymax,n=-1))

# Make the plot
#ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
 # geom_rect() +
#  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
 # xlim(c(2, 4)) # Try to remove that to see how to make a pie chart

#suppression de la ligne World 
#Partenaires_Chine <- Partenaires_Chine [-61,]

#ggplot(Partenaires_Chine, aes(ymax=ymax, ymin=ymin, xmax=1, xmin=3, fill=Group.1)) +
#  geom_rect() +
 # coord_polar(theta="y") 
  
# Faire un tri sur les données ?
# Ou réussir à changer les couleurs que pour la France 



#Création d'un graphique des proportions des pays à qui la France exporte

#library(ggplot2)

# Compute percentages
#Partenaires_France$fraction <- Partenaires_France$x / sum(Partenaires_France$x)

# Compute the cumulative percentages (top of each rectangle)
# data$ymax = cumsum(data$fraction)
#Partenaires_France$ymax <- cumsum(Partenaires_France$fraction)

# Compute the bottom of each rectangle
# data$ymin = c(0, head(data$ymax, n=-1))
#Partenaires_France$ymin = c(0, head(Partenaires_France$ymax,n=-1))

# Make the plot
#ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
# geom_rect() +
#  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
# xlim(c(2, 4)) # Try to remove that to see how to make a pie chart

#suppression de la ligne World 
#Partenaires_France <- Partenaires_France [-75,]

#ggplot(Partenaires_France, aes(ymax=ymax, ymin=ymin, xmax=1, xmin=3, fill=Group.1)) +
#  geom_rect() +
 # coord_polar(theta="y") 

# Faire un tri sur les données ? 
# changer de type de graphiques 

###########################################################################################


# Make the plot
#ggplot(data=A, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type)) + 
  # geom_line() + 
  # geom_ribbon(alpha=0.5) + 
  # scale_x_log10() + 
  # scale_y_log10() + 
  #  xlab(as.expression(expression( paste("Radius (", R[500], ")") ))) + 
 # ylab("Scaled Temperature")

