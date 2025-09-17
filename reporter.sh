#!/bin/bash

# Paths
BASE_DIR="$HOME/ISDN3000C_Lab0"
FINAL_REPORT_DIR="$BASE_DIR/final_report"
REPORT_FILE="$FINAL_REPORT_DIR/analysis_report.md"
PLAYER_LOG="$FINAL_REPORT_DIR/player_connections.log"

# Create final_report directory
mkdir -p "$FINAL_REPORT_DIR"

# Download log file directly from GitHub raw link
curl -s -o "$BASE_DIR/game.log" "https://raw.githubusercontent.com/siyanhu/25Fall_ISDN3000C/master/Lab02/assignment.log"

# Report header
echo "# Server Analysis Report" > "$REPORT_FILE"
date >> "$REPORT_FILE"

# Extract INFO logs
grep "INFO" "$BASE_DIR/game.log" > "$PLAYER_LOG"

# Count values
WARN_COUNT=$(grep -c "WARN" "$BASE_DIR/game.log")
CRITICAL_COUNT=$(grep -c "CRITICAL" "$BASE_DIR/game.log")
LOGIN_COUNT=$(grep -c "LOGIN SUCCESS" "$BASE_DIR/game.log")

# Append summary
echo "## Summary" >> "$REPORT_FILE"
echo "- Total Warning: $WARN_COUNT" >> "$REPORT_FILE"
echo "- Total Critical Errors: $CRITICAL_COUNT" >> "$REPORT_FILE"
echo "- Total Player Logins: $LOGIN_COUNT" >> "$REPORT_FILE"

