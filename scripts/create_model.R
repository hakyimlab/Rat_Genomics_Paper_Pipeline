argv <- commandArgs(trailingOnly = TRUE)
source("scripts/GTEx_Tissue_Wide_CV_elasticNet.R")

tis <- argv[1]
chrom <- argv[2]
alpha <- as.numeric(argv[3])
window <- as.numeric(argv[4])

#data_dir <- "../data/intermediate/"

expression_RDS <- tis %&% "_expression_transformed.RDS"
geno_file <- "./data/geno_by_chr/genotype.chr" %&% chrom %&% ".txt"
gene_annot_RDS <- "./data/gene_annotation.RDS"
snp_annot_RDS <- "./data/snp_annot/snp_annot.chr" %&% chrom %&% ".RDS"
n_k_folds <- 10
out_dir <- "./output/"
snpset <- "1KG_snps"

TW_CV_model(expression_RDS, geno_file, gene_annot_RDS, snp_annot_RDS,
    n_k_folds, alpha, out_dir, tis, chrom, snpset, window)