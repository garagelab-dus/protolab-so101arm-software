#!/bin/sh

# huggingface-cli is deprecated, use hf command instead
HF_USER=$(hf auth whoami)

export HF_USER

: ${EXPERIMENT:="zuweisung"}
: ${EXPERIMENT_DESC:="Gegenstandszuweisung nach Farbe"}

# remove data from previous training run
rm -rf /home/user/.cache/huggingface/lerobot/${HF_USER}/${EXPERIMENT}

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=ernie \
    --robot.cameras="{ above : {type: opencv, index_or_path: 0, width: 640, height: 480, fps: 15}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=bert \
    --display_data=true \
    --dataset.repo_id="${HF_USER}"/${EXPERIMENT} \
    --dataset.num_episodes=5 \
    --dataset.single_task="$EXPERIMENT_DESC"
