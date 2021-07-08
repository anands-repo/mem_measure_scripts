#!/bin/bash

cd $HOME

git clone https://github.com/anands-repo/memory_usage.git

echo "/opt/deepvariant/bin/run_deepvariant --model_type=PACBIO --ref=$REF --reads=$BAM --use_hp_information --output_vcf=$WORKDIR/dv.vcf --num_shards=28 --regions=chr21 --customized_model=$CHECKPOINT" > $WORKDIR/dv_cmd.sh

python $HOME/memory_usage/find_memory_usage.py $WORKDIR/dv_cmd.sh > "$WORKDIR/dv_mem.rpt" 2>&1
