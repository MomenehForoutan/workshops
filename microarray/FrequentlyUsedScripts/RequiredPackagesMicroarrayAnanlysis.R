

## check and install required packages:
currentInstalledPackages <- installed.packages(priority=NULL)[,'Package']

## check for Bioconductor packages
requiredBioconductorPackages <- c("GEOquery", "limma", "dplyr", "ggplot2", "edgeR", 
                                 "Rsubread", "affy", "simpleaffy", "gcrma",
                                 "affyPLM", "MASS", "genefilter",
                                 "matrixStats", "statmod", "GO.db", 
                                 "org.Hs.eg.db", "hthgu133a.db", "R.utils")

missingBioconductorPackages <-  setdiff(requiredBioconductorPackages,currentInstalledPackages)
if (length(missingBioconductorPackages)==0){
  message("All required Bioconductor packages are installed")
} else {
  message("Installing the following required Bioconductor packages")
  print(missingBioconductorPackages)
  source("http://bioconductor.org/biocLite.R")
  biocLite(missingBioconductorPackages)
}

library(hthgu133a.db)
library(annotate)
library(GEOquery)    ## for downloading the data from GEO
library(gcrma)       ## for gcrma()
library(affy)        ## for readAffy and rma()
library(simpleaffy)  
library(affyPLM)     ## for visualise statistical characteristics of the CEL files, such as image, RLE, NUSE
library(limma)       ## for DE analysis
library(RColorBrewer)## for choosing colours
library(dendextend)
library(MASS)        ## for isoMDS
library(genefilter)  ## for filtering the expression data
library(statmod)
library(GO.db)
library(org.Hs.eg.db)

library(R.utils)


## set the path to gene info file from NCBI:
geneInfoPath<- "/Users/Sepideh/Documents/data/mappingIDs/"
##----- read gene info file from NCBI:
geneInfoNCBI<- read.delim(paste0(geneInfoPath, "Homo_sapiens.gene_info"))


message("Setup for microarray analysis completed")

