#!/bin/bash

set -e

cd /scratch/ubuntu/aramach4

datestamp=$(date | awk '{print $6"_"$2"_"$3"_"$4"_"$5}' | sed 's/://g')

mkdir mem_comparison_${datestamp}

cd mem_comparison_${datestamp}

WORKDIR=$(pwd)

BAM=/home/aramach4/pacbio_reruns/PacbioHaplotagged_timestamp2021_May_7_140916_CDT/GIAB_HG003_GRCh38/pacbio_splits_2020_10_18_1932/15x/alignment.hello_distrust_genotypes2021_May_5_134644_CDT.haplotagged.bam
REF=/home/aramach4/ref/GCA_000001405.15_GRCh38_no_alt_plus_hs38d1_analysis_set.fa

scp aramach4@hal.ncsa.illinois.edu:${BAM}* $WORKDIR/
scp aramach4@hal.ncsa.illinois.edu:${REF}* $WORKDIR/

BAM=$WORKDIR/$(basename $BAM)
REF=$WORKDIR/$(basename $REF)

echo $BAM
echo $REF
