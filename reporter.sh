#!/bin/bash

# 1. Set paths
BASE_DIR="$HOME/ISDN3000C_Lab02"
RAW_DATA_DIR="$BASE_DIR/raw_data"
FINAL_REPORT_DIR="$BASE_DIR/final_report"
LOG_FILE="$RAW_DATA_DIR/game.log"
REPORT_FILE="$FINAL_REPORT_DIR/analysis_report.md"
PLAYER_LOG="$FINAL_REPORT_DIR/player_connections.log"

# 2. Create directories if not exist
mkdir -p "$RAW_DATA_DIR" "$FINAL_REPORT_DIR"

# 3. Download assignment.log from GitHub (raw link)
RAW_URL="https://raw.githubusercontent.com/siyanhu/25Fall_ISDN3000C/master/Lab02/assignment.log"
curl -s -o "$LOG_FILE" "$RAW_URL"

# 4. Generate report header
echo "# Server Analysis Report" > "$REPORT_FILE"
date >> "$REPORT_FILE"

# 5. Extract all INFO logs
grep "INFO" "$LOG_FILE" > "$PLAYER_LOG"

# 6. Count Warnings
WARN_COUNT=$(grep -c "WARN" "$LOG_FILE")

# 7. Count Critical Errors
CRITICAL_COUNT=$(grep -c "CRITICAL" "$LOG_FILE")

# 8. Count Player Logins
LOGIN_COUNT=$(grep -c "LOGIN SUCCESS" "$LOG_FILE")

# 9. Append summary to report
echo "## Summary" >> "$REPORT_FILE"
echo "- Total Warning: $WARN_COUNT" >> "$REPORT_FILE"
echo "- Total Critical Errors: $CRITICAL_COUNT" >> "$REPORT_FILE"
echo "- Total Player Logins: $LOGIN_COUNT" >> "$REPORT_FILE"

