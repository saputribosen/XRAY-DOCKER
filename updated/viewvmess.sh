#!/bin/bash
# My Telegram : https://t.me/Opindoo
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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl https://raw.githubusercontent.com/saputribosen/scriptfree/main/ipvps.txt | grep $MYIP | awk '{print $3}')
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
exit 0
fi
clear
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Select the existing client you want to view detail"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No User    Expired"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
clear
echo " "
if [ -s "/usr/bin/vmess/vmess-$user.txt" ]; then
    cat "/usr/bin/vmess/vmess-$user.txt"
elif [ -s "/usr/bin/vmess/vmess-$user-ntls.txt" ]; then
    cat "/usr/bin/vmess/vmess-$user-ntls.txt"
else
    echo "File not found"
fi

systemctl restart xray.service
echo " "
echo -e ""
echo -e "$BLUE╔═══════════════════════════════════════$BLUE╗"
echo -e "$BLUE╠➣$NC 0$NC. Back to Menu Xray           $BLUE      ║ "
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC Script Menu by ARYO                  $BLUE║"
echo -e "$BLUE╠➣$NC Telegram https://t.me/Opindoo        $BLUE║"
echo -e "$BLUE╚═══════════════════════════════════════╝$NC"  
read -p " ➣ Select From Options [ 0 ]:  " menu
echo -e ""
case $menu in
0)
maddxray
;;
*)
clear
bash menu
;;
esac
#