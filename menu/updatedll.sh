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
# =========================================
# Getting
#
cd
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/airavpn/ipvps.conf
if [[ "$IP" = "" ]]; then
    clear
    echo -e " ${error1}Gagal Install-Update.."
    sleep 2
    exit 0
else
    clear
    echo -e "${success}Installasi Update Menu..."
    sleep 2
fi
# ==========================================
# Tambah Menu
# link hosting kalian 
airassh1="raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu"
airassh2="raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/updated"
airassh3="raw.githubusercontent.com/saputribosen/XRAY-WS/main/updated"
airassh4="raw.githubusercontent.com/saputribosen/scriptfree/main/backup"
cd
rm -r updatedll
wget -O updatedll "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/updatedll.sh"
rm -rf updatedll

# hapus
cd /usr/bin
rm -rf xmenu
rm -rf updatedll
rm -r updatedll
# download
#
cd /usr/bin
# update by SL
# wget -O xmenu "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/xmenu.sh"
wget -O add-akun "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/add-akun.sh"
wget -O updatedll "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/updatedll.sh"
wget -O add-akun "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/add-akun.sh"
wget -O delete-akun "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/delete-akun.sh"
wget -O certv2ray "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/restart-xray.sh"
# wget -O xmenu "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/xmenu.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/cek-port.sh"
# wget -O xmenu "https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/menu/xmenu.sh"
# Update menu
wget -O menu "${airassh2}/menu.sh"
wget -O msettings "${airassh2}/msetting.sh"
wget -O maddxray "${airassh2}/maddxray.sh"
wget -O start-menu "${airassh2}/start-menu.sh"
#wget -O mbackup "${airassh2}/mbackup.sh"
# update menu backup
# wget -O addemail "${airassh4}/addemail.sh"
# wget -O autobackup "${airassh4}/autobackup.sh"
# wget -O backup "${airassh4}/backup.sh"
# wget -O changesend "${airassh4}/changesend.sh"
# wget -O limitspeed "${airassh4}/limitspeed.sh"
# wget -O restore "${airassh4}/restore.sh"
# wget -O startbackup "${airassh4}/startbackup.sh"
# wget -O stopbackup "${airassh4}/stopbackup.sh"
# wget -O testsend "${airassh4}/testsend.sh"
# update xray menu
wget -O addvmess "${airassh3}/addvmess.sh"
wget -O addvmessntls "${airassh3}/addvmessntls.sh"
wget -O addvmessgrpc "${airassh3}/addvmessgrpc.sh"
wget -O viewvmess "${airassh3}/viewvmess.sh"
wget -O dellvmess "${airassh3}/dellvmess.sh"
wget -O rennewvmess "${airassh3}/rennewvmess.sh"
wget -O rennewvmessntls "${airassh3}/rennewvmessntls.sh"
wget -O addvless "${airassh3}/addvless.sh"
wget -O dellvless "${airassh3}/dellvless.sh"
wget -O rennewvless "${airassh3}/rennewvless.sh"
wget -O addtrojan "${airassh3}/addtrojan.sh"
wget -O viewtrojan "${airassh3}/viewtrojan.sh"
wget -O addtrojangrpc "${airassh3}/addtrojangrpc.sh"
wget -O delltrojan "${airassh3}/delltrojan.sh"
wget -O rennewtrojan "${airassh3}/rennewtrojan.sh"
wget -O addss "${airassh3}/addss.sh"
wget -O dellss "${airassh3}/dellss.sh"
wget -O rennewss "${airassh3}/rennewss.sh"
wget -O adddomain "${airassh3}/adddomain.sh"
wget -O chngedomain "${airassh3}/chngedomain.sh"
wget -O chngeport "${airassh3}/chngeport.sh"
wget -O certxray "${airassh3}/certxray.sh"
wget -O wgetup "${airassh3}/wgetup.sh"
wget -O xp "${airassh3}/xp.sh"
wget -O akses "${airassh3}/akses.sh"

#Permissions
chmod +x /usr/bin/updatedll
# chmod +x /usr/bin/xmenu
# chmod +x xmenu
chmod +x add-akun
chmod +x delete-akun
chmod +x updatedll
chmod +x add-akun
chmod +x certv2ray
chmod +x restart-xray
chmod +x auto-pointing
chmod +x cek-port
# update menu
chmod +x msettings
chmod +x maddxray
chmod +x start-menu
chmod +x menu
# update xray menu
chmod +x addvmess
chmod +x addvmessntls
chmod +x viewvmess
chmod +x addvmessgrpc
chmod +x dellvmess
chmod +x rennewvmess
chmod +x rennewvmessntls
chmod +x addvless
chmod +x dellvless
chmod +x rennewvless
chmod +x addtrojan
chmod +x viewtrojan
chmod +x addtrojangrpc
chmod +x delltrojan
chmod +x rennewtrojan
chmod +x addss
chmod +x dellss
chmod +x rennewss
chmod +x certxray
chmod +x wgetup
chmod +x adddomain
chmod +x chngedomain
chmod +x chngeport
chmod +x xp
chmod +x akses
#update menu backup
# chmod +x addemail
# chmod +x autobackup
# chmod +x backup
# chmod +x changesend
# chmod +x limitspeed
# chmod +x restore
# chmod +x startbackup
# chmod +x stopbackup
# chmod +x testsend
# chmod +x mbackup

clear
echo -e "Update Menu Selesai..."
cd
