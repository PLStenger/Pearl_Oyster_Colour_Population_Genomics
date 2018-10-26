#!/usr/bin/env Rscript

setwd("/home1/scratch/creisser/PL_BAM_MD/")

library(ggplot2)


dat <- read.table("individuals.vcf_DP10_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf.copy.modif_chi2_v3", skip=1)
colnames(dat) <- c("CHROM", "POS", "REF", "ALT", "P")
dat2 <- data.frame(dat$CHROM, dat$POS, dat$POS, dat$P)
colnames(dat2) <- c("SNP", "CHR", "BP", "P")

don <- dat2
  
  # Compute chromosome size
  group_by(CHR) 
  summarise(chr_len=max(BP)) 
  
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) 
  select(-chr_len) 
 
  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) 
  
  # Add a cumulative position of each SNP
  arrange(CHR, BP) 
  mutate( BPcum=BP+tot)

axisdf = don  
group_by(CHR)
summarize(center=( max(BPcum) + min(BPcum) ) / 2 )


ggplot(don, aes(x=BPcum, y=-log10(P))) +
    
    # Show all points
    geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
    scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +
    
    # custom X axis:
    scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
    scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  
    # Custom the theme:
    theme_bw() +
    theme( 
      legend.position="none",
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )



