#!/bin/bash
# get_data.sh — 下载并保存 assignment.log 为 raw_data/game.log

# 确保目标目录存在
mkdir -p raw_data

RAW_DIR="raw_data"
GAME_LOG="game.log"
URL="https://raw.githubusercontent.com/siyanhu/25Fall_ISDN3000C/master/Lab02/assignment.log"

# 下载日志并保存
curl -fsSL "$URL" -o "$RAW_DIR/$GAME_LOG"

# 验证下载是否成功
if [[ ! -s "$RAW_DIR/$GAME_LOG" ]]; then
  echo "Error: 无法下载 assignment.log 或文件为空"
  exit 1
fi

echo "已下载并保存到 $RAW_DIR/$GAME_LOG"
