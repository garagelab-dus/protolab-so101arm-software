#!/bin/sh
# use calibration data from calibration run performed
# on 2025-09-06

CALIBDATA_DIR=$PWD/calib-data
CACHEDIR=$HOME/.cache/huggingface/lerobot/calibration

mkdir -p $CACHEDIR
cp $CALIBDATA_DIR/ernie.json $CACHEDIR/robots/so101_follower/
cp $CALIBDATA_DIR/bert.json $CACHEDIR/teleoperators/so101_leader/
