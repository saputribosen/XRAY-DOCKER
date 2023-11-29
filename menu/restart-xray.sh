#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
#information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
clear
echo -e "${OK}Please Wait..."
service daemon-reload
sleep 1
service xray enable
sleep 1
service xray restart
service nginx restart
sleep 1
service runn enable
service runn restart
clear
echo "${OK}Xray.service berhasil di restart"
sleep 3
menu
