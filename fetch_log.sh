#!/bin/bash
# 下载远程 assignment.log 并保存为 raw_data/game.log
curl -sSL \
  https://raw.githubusercontent.com/siyanhu/25Fall_ISDN3000C/master/Lab02/assignment.log \
  -o raw_data/game.log
