#!/bin/bash

MOUNT_SOURCE=
MOUNT_TARGET=
WORKDIR=
BAM=
REF=

docker run -it --rm -v $MOUNT_SOURCE:$MOUNT_TARGET \
    --env "WORKDIR=$WORKDIR" \
    --env "BAM=$BAM" \
    --env "REF=$REF" \
    bash $WORKDIR/hello_prepare.sh
    
