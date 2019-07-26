#!/usr/bin/env Rscript

setwd("/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified")

library(ggplot2)
library(ggfortify)

#plot_percent_var <- function(pca, pc){
#  # Calcule du pourcentage de variance
#  percent_var_explained <- (pca$sdev^2 / sum(pca$sdev^2))*100
#  # Préparation d'un tableau avec le numéro des composantes principales 
#  # et le pourcentage de variance qui lui est associé
#  percent_var_explained <- data.frame(
#    PC=1:length(percent_var_explained),
#    percent_Var=percent_var_explained
#  )
#  # Récupérer uniquement le nombre de PC indiqué en argument
#  sub_percent_var_explained <- percent_var_explained[1:pc,]
#  # Génère le graphique
#  p <- ggplot(sub_percent_var_explained, aes(x=PC, y=percent_Var)) + 
#    # Génère un barplot
#    geom_col()+
#    # Utilise le thème "black and white"
#    theme_bw() +
#    # Renomme l'axe des abscisses
#    xlab("PCs") +
#    # Renomme l'axe des ordonnées
#    ylab("% Variance") +
#    # Titre du graphique
#    ggtitle("Screeplot")+
#    # Option de taille des éléments textuels
#    theme(
#      axis.text=element_text(size=16),
#      axis.title=element_text(size=16),
#      legend.text = element_text(size =16),
#      legend.title = element_text(size =16 ,face="bold"),
#      plot.title = element_text(size=18, face="bold", hjust = 0.5),
#      # Astuce pour garder un graphique carré
#      aspect.ratio=1
#    )
#  # Affiche le graphique
#  print(p)
#}
#
#plot_pca <- function(pca=pca, pc=pc, conditions=conditions, colours=colours){
#  # Transforme le nombre de PC en argument en nom de PC 
#  PCs <- paste("PC",1:pc, sep="")
#  # Calcule le pourcentage de variance par PC
#  percent_var_explained <- (pca$sdev^2 / sum(pca$sdev^2))*100
#  # Transforme le vecteur de conditions en un facteur
#  cond <- factor(conditions)
#  # Crée un autre facteur avec les conditions
#  col <- factor(conditions)
#  # Change les niveaux du facteur avec la palette de couleur pour attribuer
#  # à chaque condition une couleur
#  levels(col) <- colours
#  # Re-transforme le facteur en vecteur
#  col <- as.vector(col)
#  # Récupère les scores pour le graphique
#  scores <- as.data.frame(pca$x)
#  # Génère toutes les combinaisons possibles de PC 
#  PCs.combinations <- combn(PCs,2)
#  # Génère un graphique pour chaque combinaison
#  # avec une boucle apply
#  g <- apply(
#    PCs.combinations,
#    2,
#    function(combination)
#    {
#      p1 <- ggplot(scores, aes_string(x=combination[1], y=combination[2])) +
#        # Dessine des points avec une bordure de 0.5 remplis avec une couleur
#        geom_point(shape = 21, size = 2.5, stroke=0.5, aes(fill=cond)) +
#        # Utilise le thème "black and white"
#        theme_bw() +
#        # Spécifie la palette de couleur et donne un titre vide à la légende
#        scale_fill_manual(
#          values=colours,
#          name=""
#        ) +
#        # Renomme le titre des axes des abscisses et des ordonnées en "PCx (pourcentage de variance)" avec 3 chiffres après la virgule
#        xlab(paste(combination[1], " (",round(percent_var_explained[as.numeric(gsub("PC", "", combination[1]))], digit=3),"%)", sep=""))+
#        ylab(paste(combination[2], " (",round(percent_var_explained[as.numeric(gsub("PC", "", combination[2]))], digit=3),"%)", sep=""))+
#        # Titre du graphique
#        ggtitle("PCA")+
#        # Option de taille des éléments texte
#        theme(
#          axis.text=element_text(size=16),
#          axis.title=element_text(size=16),
#          legend.text = element_text(size =16),
#          legend.title = element_text(size =16 ,face="bold"),
#          plot.title = element_text(size=18, face="bold", hjust = 0.5),
#          # Astuce pour garder un graphique carré
#          aspect.ratio=1
#        )
#      # Affiche le graphique
#      print(p1)
#    }
#  )
#}
#

data <- read.table("AF_pool10ER.txt", skip=1)
datb <- read.table("AF_pool11EJ.txt", skip=1)
datc <- read.table("AF_pool12EV.txt", skip=1)
datd <- read.table("AF_pool1TR.txt", skip=1)
date <- read.table("AF_pool2TJ.txt", skip=1)
datf <- read.table("AF_pool3TV.txt", skip=1)
datg <- read.table("AF_pool4GR.txt", skip=1)
dath <- read.table("AF_pool5GJ.txt", skip=1)
dati <- read.table("AF_pool6GV.txt", skip=1)
datj <- read.table("AF_pool7KR.txt", skip=1)
datk <- read.table("AF_pool8KJ.txt", skip=1)
datl <- read.table("AF_pool9KV.txt", skip=1)


dat <- data.frame(data$V2,  datb$V2,  datc$V2,  datd$V2,  date$V2,  datf$V2,  datg$V2,  dath$V2,  dati$V2,  datj$V2,  datk$V2,  datl$V2)
colnames(dat) <- c("Hatchery_Red", "Hatchery_Yellow", "Hatchery_Green", "Takapoto_Red", "Takapoto_Yellow", "Takapoto_Green", "Gambier_Red", "Gambier_Yellow", "Gambier_Green", "Katiu_Red", "Katiu_Yellow", "Katiu_Green")
head(dat)
str(dat)
str(dat$Hatchery_Red)

dat2 <- t(dat)
head(dat2)

#group <- as.factor(c("Hatchery_Red", "Hatchery_Yellow", "Hatchery_Green", "Takapoto_Red", "Takapoto_Yellow", "Takapoto_Green", "Gambier_Red", "Gambier_Yellow", "Gambier_Green", "Katiu_Red", "Katiu_Yellow", "Katiu_Green"))
#
##palette <- c("firebrick1", "gold1", "chartreuse1","firebrick2", "gold2", "chartreuse2","firebrick3", "gold3", "chartreuse3","firebrick4", "gold4", "chartreuse4")
#palette <- c("darkorange2", "darkorchid3", "darkseagreen", "darkslateblue", "gray", "gray7", "deeppink1", "lightpink", "steelblue1", "firebrick4", "gold4", "chartreuse4")
#
#pca <- prcomp(dat2, center=TRUE, scale=TRUE)
#
#pdf("plot_percent_var2.pdf")
#plot_percent_var(pca, 3)
#dev.off()
#
#pdf("plot_pca2.pdf")
#plot_pca(
#  pca=pca, 
#  pc=2, 
#  conditions=group, 
#  colours=palette
#)
#dev.off()
#
#

#site <- c("Hatchery", "Hatchery", "Hatchery", "Takapoto", "Takapoto", "Takapoto", "Gambier", "Gambier", "Gambier", "Katiu", "Katiu", "Katiu")
#phenotype <- c("Red", "Yellow", "Green", "Red", "Yellow", "Green", "Red", "Yellow", "Green", "Red", "Yellow", "Green")
#
#dat3 <- data.frame(dat2, site, phenotype)
#str(dat3)
#
#df <- dat3[c(1:49)]
#
#autoplot(prcomp(df), data = dat3, colour="phenotype", shape="site", fill="phenotype")+
#  scale_colour_manual(values=c("forestgreen","firebrick","goldenrod1"))+
#  scale_fill_manual(values=c("forestgreen","firebrick","goldenrod1"))+
#  scale_shape_manual(values=c(25,22,23,21)) + 
#  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#        panel.background = element_blank(), axis.line = element_line(colour = "black"),
#        legend.key = element_rect(fill = "transparent", colour = "transparent"))
#

plot_pca_PL <- function(pca=pca, pc=pc, conditions_color=conditions_color, conditions_fill=conditions_fill, conditions_shape=conditions_shape, colours=colours, shapes=shapes, fills=fills){
  # Transforme le nombre de PC en argument en nom de PC 
  PCs <- paste("PC",1:pc, sep="")
  # Calcule le pourcentage de variance par PC
  percent_var_explained <- (pca$sdev^2 / sum(pca$sdev^2))*100
  
  
  # Transforme le vecteur de conditions en un facteur
  cond_color <- factor(conditions_color)
  # Crée un autre facteur avec les conditions
  col <- factor(conditions_color)
  # Change les niveaux du facteur avec la palette de couleur pour attribuer
  # à chaque condition une couleur
  levels(col) <- colours
  # Re-transforme le facteur en vecteur
  col <- as.vector(col)
  
  
  # Transforme le vecteur de conditions en un facteur
  cond_shape <- factor(conditions_shape)
  # Crée un autre facteur avec les conditions
  sha <- factor(conditions_shape)
  # Change les niveaux du facteur avec la palette de forme pour attribuer
  # à chaque condition une forme
  levels(sha) <- shapes
  # Re-transforme le facteur en vecteur
  sha <- as.vector(sha)
  
  
  # Transforme le vecteur de conditions en un facteur
  cond_fill <- factor(conditions_fill)
  # Crée un autre facteur avec les conditions
  fil <- factor(conditions_fill)
  # Change les niveaux du facteur avec la palette de forme pour attribuer
  # à chaque condition une forme
  levels(fil) <- fills
  # Re-transforme le facteur en vecteur
  fil <- as.vector(fil)
  
  # Récupère les scores pour le graphique
  scores <- as.data.frame(pca$x)
  # Génère toutes les combinaisons possibles de PC 
  PCs.combinations <- combn(PCs,2)
  # Génère un graphique pour chaque combinaison
  # avec une boucle apply
  g <- apply(
    PCs.combinations,
    2,
    function(combination)
    {
      p1 <- ggplot(scores, aes_string(x=combination[1], y=combination[2])) +
        # Dessine des points avec une bordure de 0.5 remplis avec une couleur
       # geom_point(shape = 21, size = 2.5, stroke=0.5, aes(colour=cond_color, shape=cond_shape, fill=cond_color)) + 
        geom_point(size = 2.5, stroke=0.7,  aes(colour=cond_color, shape=cond_shape, fill=cond_fill)) + #  geom_point(size = 2.5, stroke=1,  aes(colour=cond_color, shape=cond_shape, fill=cond_fill)) +
        # Utilise le thème "black and white"
        theme_bw() +
        # Spécifie la palette de couleur et donne un titre vide à la légende
        scale_colour_manual(values=colours, name="Phenotypes") + # scale_colour_manual(values=c("forestgreen","firebrick","goldenrod1"))+
        scale_fill_manual(values=fills, name="Phenotypes") +
        #scale_shape_manual(values=c(25,22,23,21)) +
        scale_shape_manual(values=shapes, name="Sites") +
        # Renomme le titre des axes des abscisses et des ordonnées en "PCx (pourcentage de variance)" avec 3 chiffres après la virgule
        xlab(paste(combination[1], " (",round(percent_var_explained[as.numeric(gsub("PC", "", combination[1]))], digit=3),"%)", sep=""))+
        ylab(paste(combination[2], " (",round(percent_var_explained[as.numeric(gsub("PC", "", combination[2]))], digit=3),"%)", sep=""))+
        # Titre du graphique
        ggtitle("Principal Component Analysis of allelic frequencies") +
        # Option de taille des éléments texte
          theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                panel.background = element_blank(), axis.line = element_line(colour = "black"),
                legend.key = element_rect(fill = "transparent", colour = "transparent"))
      # Affiche le graphique
      print(p1)
    }
  )
}


pca <- prcomp(dat2, center=TRUE, scale=TRUE)

site <- as.factor(c("Hatchery", "Hatchery", "Hatchery", "Takapoto", "Takapoto", "Takapoto", "Gambier", "Gambier", "Gambier", "Katiu", "Katiu", "Katiu"))
phenotype <- as.factor(c("Red", "Yellow", "Green", "Red", "Yellow", "Green", "Red", "Yellow", "Green", "Red", "Yellow", "Green"))
palette <- c("forestgreen","firebrick","goldenrod1")

plot_pca_PL(
  pca=pca, 
  pc=2, 
  conditions_color=phenotype,
  conditions_shape=site,
  conditions_fill=phenotype,
  colours=palette, 
  shapes=c(21,22,23,24),
  fills=palette
)

ggsave("PCA_plot_2.png", width = 5.5, height = 4.5)
