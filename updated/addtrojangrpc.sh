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
MYAD=$(wget -qO- ipinfo.io/org);
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
tr="$(cat ~/log-install.txt | grep -w "XRAYS TROJAN WS TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		user_EXISTS=$(grep -wE "^#&# ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)

		if [[ ${user_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
sleep 3
echo -e "[ ${green}TUNGGU${NC} ] Akun sedang dibuat... "
uuid=$(cat /proc/sys/kernel/random/uuid)
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojangrpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray.service
#buattrojangrpc
trojanlinkgrpc="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=aryo-grpc&sni=bug.com#${user}"
service cron restart
#tampil log.txt
cd /usr/bin/trojan
clear
echo -e "" | tee -a trojan-${user}-grpc.txt
echo -e "======-TROJAN-GRPC======" | tee -a trojan-${user}-grpc.txt
echo -e "ISP        : ${MYAD}" | tee -a trojan-${user}-grpc.txt
echo -e "Region     : ${MYREG}" | tee -a trojan-${user}-grpc.txt
echo -e "Remark     : ${user}" | tee -a trojan-${user}-grpc.txt
echo -e "Host       : ${domain}" | tee -a trojan-${user}-grpc.txt
echo -e "Port       : ${tr}" | tee -a trojan-${user}-grpc.txt
echo -e "Password   : ${uuid}" | tee -a trojan-${user}-grpc.txt
echo -e "Network    : gRPC" | tee -a trojan-${user}-grpc.txt
echo -e "ServiceName: aryo-grpc" | tee -a trojan-${user}-grpc.txt
echo -e "Created    : $hariini" | tee -a trojan-${user}-grpc.txt
echo -e "Expired    : $exp" | tee -a trojan-${user}-grpc.txt
echo -e "==========================" | tee -a trojan-${user}-grpc.txt
echo -e "Link trojan gRPC  : ${trojanlinkgrpc}" | tee -a trojan-${user}.txt
echo -e "==========================" | tee -a trojan-${user}-grpc.txt
echo -e "Terimakasih ${user}" | tee -a trojan-${user}-grpc.txt
echo -e "" | tee -a trojan-${user}-grpc.txt
