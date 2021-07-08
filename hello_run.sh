#!/bin/bash

set -e

cd $HOME

apt-get -y install git

mkdir git-lfs
cd git-lfs
wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.3/git-lfs-linux-amd64-v2.13.3.tar.gz
tar xvfz git-lfs-linux-amd64-v2.13.3.tar.gz
./install.sh
cd $HOME

git clone https://github.com/anands-repo/hello.git
cd hello
git lfs pull
cd -

mkdir $HOME/code
mv hello/hello_dev.tar.gz $HOME/code/
cd $HOME/code
tar xvfz hello_dev.tar.gz
cd hello_dev
cmake .
make -j 24

cd $HOME

git clone https://github.com/anands-repo/memory_usage.git

echo "python $HOME/code/hello_dev/python/call.py --pbam $BAM --ref $REF --network $HOME/hello/models/pacbio_multi_coverage_mapq_threshold_hg002_with_hp_tags_separate_train_val_2021_04_30_201011.dp_model.wrapper.dnn --num_threads 28 --workdir $WORKDIR/calls --mapq_threshold 5 --include_hp --chromosomes chr21" > $WORKDIR/hello_command.sh

python $HOME/memory_usage/find_memory_usage.py "$HOME/hello_command.sh" > $WORKDIR/hello_command.rpt 2>&1


