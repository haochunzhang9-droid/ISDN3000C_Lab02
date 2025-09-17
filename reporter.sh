#!/bin/bash

FINAL_REPORT_DIR="$(pwd)/final_report"
REPORT_FILE="$FINAL_REPORT_DIR/analysis_report.md"
PLAYER_LOG="$FINAL_REPORT_DIR/player_connections.log"

mkdir -p "$FINAL_REPORT_DIR"

# Download log file directly from GitHub raw link
curl -s -o temp_game.log "https://raw.githubusercontent.com/siyanhu/25Fall_ISDN3000C/master/Lab02/assignment.log"

# Report header
echo "# Server Analysis Report" > "$REPORT_FILE"
date >> "$REPORT_FILE"

# Extract INFO logs
grep "INFO" temp_game.log > "$PLAYER_LOG"

# Count values
WARN_COUNT=$(grep -c "WARN" temp_game.log)
CRITICAL_COUNT=$(grep -c "CRITICAL" temp_game.log)
LOGIN_COUNT=$(grep -c "LOGIN SUCCESS" temp_game.log)

# Append summary
echo "## Summary" >> "$REPORT_FILE"
echo "- Total Warning: $WARN_COUNT" >> "$REPORT_FILE"
echo "- Total Critical Errors: $CRITICAL_COUNT" >> "$REPORT_FILE"
echo "- Total Player Logins: $LOGIN_COUNT" >> "$REPORT_FILE"

# Remove temp log file
rm temp_game.log

