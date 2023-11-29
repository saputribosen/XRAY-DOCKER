#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# Path to the log file
log_file="/var/log/xray/access.log"
unique_admins=$(awk '/email:/{print $NF}' "$log_file" | sort -u)

# Display the results
for admin_email in $unique_admins; do
    echo -e "${NC}User: ${GREEN} $admin_email ${NC}"
    echo "---------------------"
    grep -w "email: $admin_email" "$log_file" | grep "accepted" | awk '{split($3, a, ":"); print a[1]}' | sort -u
    echo
done
