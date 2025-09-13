echo "# Server Analysis Report" > final_report/analysis_report.md
date >> final_report/analysis_report.md
grep "INFO" raw_data/game.log > final_report/player_connections.log
warn_count=$(grep "WARN" raw_data/game.log | wc -l)
critical_count=$(grep "CRITICAL" raw_data/game.log | wc -l)
echo "## Summary" >> final_report/analysis_report.md
echo "- Total Warning: $warn_count" >> final_report/analysis_report.md
echo "- Total Critical Errors: $critical_count" >> final_report/analysis_report.md
login_count=$(grep "LOGIN SUCCESS" raw_data/game.log | wc -l)
echo "- Total Player Logins: $login_count" >> final_report/analysis_report.md


