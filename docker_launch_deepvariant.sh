#!/bin/bash

BAM=
REF=
WORKDIR=
CHECKPOINT=
MOUNT_SOURCE=
MOUNT_TARGET=

docker run --rm -it -v $MOUNT_SOURCE:$MOUNT_TARGET \
    --env "BAM=$BAM" \
    --env "REF=$REF" \
    --env "WORKDIR=$WORKDIR" \
    --env "CHECKPOINT=$CHECKPOINT" \
    google/deepvariant:1.1.0 \
    bash $WORKDIR/deepvariant_run.sh
