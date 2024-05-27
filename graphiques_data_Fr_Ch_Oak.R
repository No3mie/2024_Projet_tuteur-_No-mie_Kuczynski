####################################################################################################################################
######################################################### CREATION GRAPHIQUES ######################################################
####################################################################################################################################

# Chemin d'accès
setwd("C:/Users/Nono/Desktop/Univ Lorraine/Projet TUT/R/2024_Projet_tuteure_Noemie_Kuczynski")

# Ouverture données 
Data_Fr_Ch_combine_2001_2020 <- read.csv("Data_Fr_Ch_combine_2001_2020.csv", sep = ";", stringsAsFactors = T)
str(Data_Fr_Ch_combine_2001_2020)

Partenaires_France <- read.csv("Partenaires_France.csv", sep = ";", stringsAsFactors = T)

Partenaires_Chine <- read.csv("Partenaires_Chine.csv", sep = ";", stringsAsFactors = T)

#######################################################################################################################################
# Création d'un graphique avec la chronologie des imports et exports ($)

# library
library(ggplot2)

# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")





#######################################################################################################################################
# Création d'un graphique des proportions des pays qui exportent à la chine 

# load library
library(ggplot2)

# Create test data.
data <- data.frame(
  category=c("A", "B", "C"),
  count=c(10, 60, 30)
)

# Compute percentages
data$fraction = data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax = cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin = c(0, head(data$ymax, n=-1))

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
  xlim(c(2, 4)) # Try to remove that to see how to make a pie chart




#Création d'un graphique des proportions des pays à qui la France exporte



