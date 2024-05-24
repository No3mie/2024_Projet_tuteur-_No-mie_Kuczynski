# Matériel et méthodes : 
Présentation (et justification si nécessaire) des méthodes de collecte, de traitement des données et des informations, et/ou des principes et protocoles expérimentaux suivis. (3 pages)  

## Bibliographie : 
Tout d’abord, des recherches d’articles sur des moteurs de recherches comme Sciences direct, Springer Link, Web of Sciences et Google Scholar ont été faites avec des mots clés tel que : French wood export, log, trade, rapport exportations Chêne France, Mythe exportation bois France, France oak export, China wood commerce, China wood import. 

Ces mots clés permettent d’obtenir quelques articles concernant le sujet. Une sélection d’articles après lecture créer  une bibliographie qui va permettre de mieux cerner le sujet, le contexte et ces problématique ainsi que d’avoir des recherches et des résultats comparables avec ceux qui vont être analyser pour les comparer. 
 

## Collecte des données : 
Les données récupérées sont celles des déclarations des douanes que les pays importateurs et exportateurs réalisent tous les ans. Ces données peuvent être récupérées sur deux sites/bases de données, UN Comtrade et FAO.	
UN Comtrade est une base de données mondiale sur le commerce international gérée par les Nations Unies, proposant des statistiques sur le commerce mondial des produits de base. La FAO (Food and Agriculture Organization) est une agence de l'ONU qui lutte pour la sécurité alimentaire à l'échelle de la planète. Et FAO Stat fournit des données sur les exportations de marchandises liées à l'agriculture, à l'alimentation et à la pêche. 

Les données conciliées sur les sites de UN Comtrade et FAO Stat comportent les noms des pays importateurs et exportateurs des marchandises, les noms des produits avec un classification précise, les quantités exportées de chaque produit ainsi que les valeurs monétaires de ces exportations.

La récupération des données a été faite sur le site d’UN Comtrade  et non pas sur celui de la FAO car le site d’UN Comtrade permet de sélectionner les marchandises plus précisément avec les grumes de chênes uniquement ce qui n’est pas possible sur le site de FAO Stat.

Cette sélection précise de marchandises est possible grâce au code Harmonise Systeme (HS). Il s’agit d’une nomenclature internationale utilisée pour classifier les marchandises en fonction de leur nature et de leur utilisation. Il a été mis au point par l'Organisation mondiale des douanes (OMD) et est utilisé par la plupart des pays du monde pour harmoniser les tarifs douaniers et faciliter le commerce international. Le code HS est composé de six chiffres, qui peuvent être étendus à dix chiffres pour une classification plus précise. Chaque code correspond à une catégorie spécifique de produits, ce qui permet de faciliter le suivi des échanges commerciaux et de garantir une uniformité dans la classification des marchandises.

Le type marchandise choisit est le bois brut de chêne, cela correspond au code HS 440391 : Bois ; chêne, brut, même écorcé ou aubier, ou grossièrement équarri, non traité. Les données concernent des bois brutes de chênes, toutes espèces de chênes confondues.

Les données téléchargées concerne une période de temps entre 2001 et 2020 pour avoir des données récentes et pour laquelle il a été vérifié que le chêne est bien référencé comme une sous-catégorie (code HS : 440391), ce qui n’était pas le cas avant les années 2000. De plus, pendant deux après la transmission des données, celles-ci peuvent être encore modifiées, harmonisées donc moins fiables et ne seront pas prises en compte pour cette analyse. 

Le téléchargement des données depuis UN Comtrade n’est possible que vers Python initialement. Mais grâce au logiciel Anaconda, l’importation des données est possibles vers R Studio où elles seront traitées. Les données sont téléchargées sur R Studio sous forme d’un fichier csv et comportent les données mondiales des importations et exportations du bois brut de chêne pour la période de temps choisie.
Le fichier est composé de 47 variables dont la date d’enregistrement de l’import ou de l’export (mois et année), le pays qui déclare l’importation ou l’exportation, le statut du pays (si il s’agit d’une exportation ou d’une importation), le pays partenaire de l’échange, le potentiel second pays partenaire, le type de code pour la classification (Harmonise System), le code du produit, la description du produit, le volume de la marchandise et son unité et le prix de la marchandise en dollar américain. 

Ces données comportent donc les déclarations de la France pour l’ensemble des exportations de bois brut de chêne vers la Chine pour la période concernée ainsi que les flux miroirs, c’est-à-dire les déclarations de la Chine pour l’ensemble des importations de bois brut de chêne venant de France. En effet, chaque flux commercial est normalement concilié normalement deux fois, une fois par le pays exportateur et une deuxième fois par le pays importateur. Ces flux devraient être similaires puisqu’ils concernent les mêmes marchandises mais il peut avoir des différences entre les renseignements donnés par les deux pays.  


## Enregistrement des données:
Les scripts R Studio sont enregistrés sur Git Hub, il s’agit d’une plateforme collaborative permettant de sauvegarder des fichiers comme des scripts R Studio, d’en garder un historique des modifications et de les partager avec des collaborateurs.


## Traitement des données :
Le traitement des données est également réalisé sur R Studio. Une fois les données correctement téléchargées, le package readr permet d’ouvrir les données, le package dplyr est utilisé pour manipuler les données avant de les exploiter et le package ggplot2 permet de créer des graphiques.

Un tri dans les données est réalisé en séparant les données concernant uniquement les exportations de bois brut de chêne français vers la Chine et leurs flux miroirs. Enfin, un autre tri regroupant tous les pays exportateurs de bois brut de chêne vers la Chine est réalisé ainsi qu’un dernier tri regroupant tous les pays qui importent du bois brut de chêne français.
