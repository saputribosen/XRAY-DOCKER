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
BPURPLE="\e[45m"
# ==========================================
#information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
clear
echo -e ""
echo -e "$BLUE╔═══════════════════════════════════════$BLUE╗"
echo -e "$BLUE║  ------------ Menu UTAMA ----------$BLUE   ║"
echo -e "$BLUE╠═══════════════════════════════════════$BLUE╣"
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC 1$NC. XRAY WS/GRPC                $BLUE      ║ "
echo -e "$BLUE╠➣$NC 2$NC. Restart Services            $BLUE      ║ "
echo -e "$BLUE╠➣$NC 3$NC. List Port Used              $BLUE      ║ "
echo -e "$BLUE╠➣$NC 4$NC. Cek Service                 $BLUE      ║ "
echo -e "$BLUE╠➣$NC 5$NC. Cek User Login              $BLUE      ║ "
echo -e "$BLUE╠➣$NC 6$NC. Settings                    $BLUE      ║ "
echo -e "$BLUE╠➣$NC 0$NC. Exit                        $BLUE      ║ "
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC Menu by ARYO                         $BLUE║"
echo -e "$BLUE╠➣$NC Telegram https://t.me/Opindoo        $BLUE║"
echo -e "$BLUE╚═══════════════════════════════════════╝$NC"  
read -p "Select From Options [ 0 - 5 ] : " menu
echo -e ""
case $menu in
1)
maddxray
;;
2)
restart-xray
;;
3)
cek-port
;;
4)
start-menu
;;
5)
akses
;;
6)
msettings
;;
0)
clear
exit
;;
*)
clear
menu
;;
esac
#
