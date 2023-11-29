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
nontls="$(cat ~/log-install.txt | grep -w "XRAYS VLESS WS HTTP" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -wE "^### ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 |  wc -l)

		if [[ ${CLIENT_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
sleep 3
echo -e "[ ${green}TUNGGU${NC} ] Akun sedang dibuat... "
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmaryo",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF

## ubah config ke base64
vmess_base642=$( base64 -w 0 <<< $vmess_json2 )
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
systemctl restart xray.service
systemctl restart xray
service cron restart
cd /usr/bin/vmess
clear
echo -e "" | tee -a vmess-${user}-ntls.txt
echo -e "" | tee -a vmess-${user}-ntls.txt
echo -e "======-VMESS-WS-Ntls-======" | tee -a vmess-${user}-ntls.txt
echo -e "ISP         : ${MYAD}" | tee -a vmess-${user}-ntls.txt
echo -e "Region      : ${MYREG}" | tee -a vmess-${user}-ntls.txt
echo -e "Remark      : ${user}" | tee -a vmess-${user}-ntls.txt
echo -e "Host        : ${domain}" | tee -a vmess-${user}-ntls.txt
echo -e "Port No TLS : ${nontls}" | tee -a vmess-${user}-ntls.txt
echo -e "UserID/UUID : ${uuid}" | tee -a vmess-${user}-ntls.txt
echo -e "Alter ID    : 0" | tee -a vmess-${user}-ntls.txt
echo -e "Security    : auto" | tee -a vmess-${user}-ntls.txt
echo -e "Network     : ws" | tee -a vmess-${user}-ntls.txt
echo -e "Path        : /vmaryo" | tee -a vmess-${user}-ntls.txt
echo -e "Created     : $hariini" | tee -a vmess-${user}-ntls.txt
echo -e "Expired     : $exp" | tee -a vmess-${user}-ntls.txt
echo -e "=========================" | tee -a vmess-${user}-ntls.txt
echo -e "Link Non TLS    : ${xrayv2ray2}" | tee -a vmess-${user}-ntls.txt
echo -e "=========================" | tee -a vmess-${user}-ntls.txt
echo -e "Terimakasih ${user}" | tee -a vmess-${user}-ntls.txt
echo -e "" | tee -a vmess-${user}-ntls.txt
