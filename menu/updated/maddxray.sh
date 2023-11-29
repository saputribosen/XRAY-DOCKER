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
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
BRED="\e[41m"
BBLUE="\e[38;5;21m"
# ==========================================
#information
OK = "$ {
  Green
}[OK]$ {
  Font
}"
Error = "$ {
  Red
}[Mistake]$ {
  Font
}"
clear
echo -e ""
echo -e "$BLUE  ╔═══════════════════════════════════════════════════════════════════════╗$NC"
echo -e "$BLUE  ║$NC $BRED                           XRAY-MultiPort                            $BLUE ║"
echo -e "$BLUE  ╚═══════════════════════════════════════════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║ $ORANGE     ✶ VMESS WS/GRPC ✶     $BLUE       ║  $ORANGE     ✶ TROJAN WS/GRPC ✶       $BLUE   ║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╠➣$NC 1. Create Account Vmess Tls  $BLUE    ╠➣$NC 7. Create Account Trojan WS   $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 2. Create Account Vmess NTls $BLUE    ╠➣$NC 8. Create Account Trojan Grpc $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 3. Create Account Vmess gRPC $BLUE    ╠➣$NC 9. Delete Account Trojan      $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 4. Delete Account Vmess      $BLUE    ╠➣$NC 10. Rennew Account Trojan     $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 5. Rennew Account Vmess      $BLUE    ╠➣$NC 11. Detail Account Trojan     $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 6. Detail Account Vmess      $BLUE    ╠➣$NC                               $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC                              $BLUE    ╠➣$NC                               $BLUE   ║ "
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║$ORANGE         ✶ VLESS WS ✶       $BLUE       ║$ORANGE     ✶ SHADOWSOCKS WS ✶            $BLUE║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╠➣$NC 12. Create Account XRAYS Vless $BLUE  ╠➣$NC 16. Create Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ╠➣$NC 13. Delete Account XRAYS Vless $BLUE  ╠➣$NC 17. Delete Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ╠➣$NC 14. Rennew Account XRAYS Vless $BLUE  ╠➣$NC 18. Rennew Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ╠➣$NC 15. Detail Account XRAYS Vless $BLUE  ╠➣$NC 19. Detail Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║                                 $BLUE  ╠➣$NC 0. Back To Menu               $BLUE   ║ "
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"

read -p " ➣ Select From Options [ 0 - 19 ]:  " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
addvmessntls
;;
3)
addvmessgrpc
;;
4)
dellvmess
;;
5)
rennewvmess
;;
6)
viewvmess
;;
7)
addtrojan
;;
8)
addtrojangrpc
;;
9)
delltrojan
;;
10)
rennewtrojan
;;
11)
viewtrojan
;;
12)
addvless
;;
13)
dellvless
;;
14)
rennewvless
;;
15)
viewvless
;;
16)
addss
;;
17)
dellss
;;
18)
rennewss
;;
19)
viewss
;;
0)
menu
;;
*)
clear
bash menu
;;
esac
#
