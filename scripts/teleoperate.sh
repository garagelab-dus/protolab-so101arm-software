#!/bin/sh

lerobot-teleoperate --robot.type=so101_follower --robot.port=/dev/ttyACM1 --robot.id=ernie --teleop.type=so101_leader --teleop.port=/dev/ttyACM0 --teleop.id=bert
