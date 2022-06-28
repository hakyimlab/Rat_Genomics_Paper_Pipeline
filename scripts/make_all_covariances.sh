#!/bin/bash
# Script to concatenate covariance fiels split by chromosome together

tissue=$1
allCovariances=$2
alpha=$3
snpset=$4
echo "GENE RSID1 RSID2 VALUE" > $allCovariances
for i in {1..20}; do
	for covfile in $(ls output/${tissue}_chr${i}_snpset_${snpset}_alpha_${alpha}_covariances.txt); do
		echo $covfile
		cat $covfile >> $allCovariances
	done
done

gzip $allCovariances

