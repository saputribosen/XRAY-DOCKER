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
MYAD=$(wget -qO- ipinfo.io/org?token=7578ac19afd785);
MYREG=$(wget -qO- ipinfo.io/region);
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
source /var/lib/airavpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "VLESS WS HTTP" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		user_EXISTS=$(grep -wE "^#### ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)

		if [[ ${user_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/vless&encryption=none&type=ws#${user}"
xrayvless3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray.service
service cron restart
cd /usr/bin/vless
clear
echo -e ""
echo -e "======-VLESS-TLS/NonTLS-======" | tee -a vless-${user}.txt
echo -e "ISP         : ${MYAD}" | tee -a vless-${user}.txt
echo -e "Region      : ${MYREG}" | tee -a vless-${user}.txt
echo -e "Remarks     : ${user}" | tee -a vless-${user}.txt
echo -e "Host        : ${domain}" | tee -a vless-${user}.txt
echo -e "Port TLS    : $tls" | tee -a vless-${user}.txt
echo -e "Port No TLS : $nontls" | tee -a vless-${user}.txt
echo -e "User ID     : ${uuid}" | tee -a vless-${user}.txt
echo -e "Encryption  : none" | tee -a vless-${user}.txt
echo -e "Network     : ws" | tee -a vless-${user}.txt
echo -e "Path        : /vless" | tee -a vless-${user}.txt
echo -e "Service-name: vless-grpc " | tee -a vless-${user}.txt
echo -e "Created     : $hariini" | tee -a vless-${user}.txt
echo -e "Expired     : $exp" | tee -a vless-${user}.txt
echo -e "=========================" | tee -a vless-${user}.txt
echo -e "Link TLS    : ${xrayvless1}" | tee -a vless-${user}.txt
echo -e "=========================" | tee -a vless-${user}.txt
echo -e "Link No TLS : ${xrayvless2}" | tee -a vless-${user}.txt
echo -e "=========================" | tee -a vless-${user}.txt
echo -e "Link GRPC   : ${xrayvless3}" | tee -a vless-${user}.txt
echo -e "=========================" | tee -a vless-${user}.txt
echo "Terimakasih ${user}" | tee -a vless-${user}.txt
