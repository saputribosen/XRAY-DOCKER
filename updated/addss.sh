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
IZIN=$( curl https://raw.githubusercontent.com/saputribosen/scriptfree/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Opindoo"
exit 0
fi
clear
IP=$(wget -qO- ipinfo.io/ip);

uuid=$(cat /proc/sys/kernel/random/uuid)
tls="$(cat ~/log-install.txt | grep -w "XRAYS SHADOWSOCKS WS TLS " | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "XRAYS SHADOWSOCKS WS HTTP " | cut -d: -f2|sed 's/ //g')"

source /var/lib/airavpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
echo ""
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -E "^##&# ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
		if [[ ${CLIENT_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
sleep 2
echo -e "[ ${green}TUNGGU${NC} ] Akun $user sedang dibuat... "
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

#buatshadowsocks
#
cipher="aes-128-gcm"
sed -i '/#ssws$/a\##&# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\##&# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@$domain:$tls?plugin=xray-plugin;mux=0;path=/shsc;host=$domain;tls#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@$domain:$tls?plugin=xray-plugin;mux=0;serviceName=ss-grpc;host=$domain;tls#${user}"
systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat > /home/vps/public_html/ss-ws-$user.txt <<-END
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/shsc"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END
cat > /home/vps/public_html/ss-grpc-$user.txt <<-END
{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END
cd /usr/bin/shadowsock
clear
echo -e ""
echo -e "======-SHADOWSOCKS-======" | tee -a ss-${user}.txt
echo -e "ISP         : $MYAD" | tee -a ss-${user}.txt
echo -e "Region      : $MYREG" | tee -a ss-${user}.txt
echo -e "Remark      : $user" | tee -a ss-${user}.txt
echo -e "Domain      : $domain" | tee -a ss-${user}.txt
echo -e "Port TLS    : $tls" | tee -a ss-${user}.txt
echo -e "Password    : $uuid" | tee -a ss-${user}.txt
echo -e "Method      : aes-128-gcm" | tee -a ss-${user}.txt
echo -e "========= Path =========="  | tee -a ss-${user}.txt
echo -e "=> WS TLS : /shsc"  | tee -a ss-${user}.txt
echo -e "=> GRPC   : ss-grpc"  | tee -a ss-${user}.txt
echo -e "=> WSS   : ws://bug.com/shsc"  | tee -a ss-${user}.txt
echo -e "========================="  | tee -a ss-${user}.txt
echo -e "Created     : $hariini" | tee -a ss-${user}.txt
echo -e "Expired     : $exp" | tee -a ss-${user}.txt
echo -e "======Import Custom Config From URL =======" | tee -a ss-${user}.txt
echo -e "Link TLS    : http://${domain}:89/ss-ws-$user.txt" | tee -a ss-${user}.txt
echo -e "=========================" | tee -a ss-${user}.txt
echo -e "Link GRPC : http://${domain}:89/ss-grpc-$user.txt" | tee -a ss-${user}.txt
echo -e "=========================" | tee -a ss-${user}.txt
echo -e "Terimakasih ${user}" | tee -a ss-${user}.txt
