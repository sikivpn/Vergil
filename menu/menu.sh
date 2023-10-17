#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
## Foreground
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
# // STATUS VPN
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi

BURIQ () {
MYIP=$(curl -sS ipv4.icanhazip.com)
curl -sS https://raw.githubusercontent.com/NevermoreSSH/sikivpn/main/permission/ipmini > /root/tmp
data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
for user in "${data[@]}"
do
exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
d1=(`date -d "$exp" +%s`)
d2=(`date -d "$biji" +%s`)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
echo $user > /etc/.$user.ini
else
rm -f /etc/.$user.ini > /dev/null 2>&1
fi
done
rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/sikivpn/Vergil/main/permission/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/sikivpn/Vergil/main/permission/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/sikivpn/Vergil/main/permission/ipmini | grep $MYIP | awk '{print $3}')
fi
#Domain & IPVPS
domain=$(cat /etc/xray/domain)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+="%"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# RAM Info
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
# Total BANDWIDTH
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "$(date +"%b '%y")" | awk '{print $9" "substr ($10, 1, 1)}')"
#total user account
vlx=$(grep -c -E "^#& " "/etc/xray/config.json") 
 let vla=$vlx/2 
 vmc=$(grep -c -E "^### " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
  
 trx=$(grep -c -E "^#! " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^## " "/etc/xray/config.json") 
 let ssa=$ssx/2 
 COLOR1='\033[0;35m' 
 COLOR2='\033[0;39m' 
 clear
echo ""
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${WB}SSH XRAYS Websocket Autoscript By NevermoreSSH${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "               ${WB}»»» Server Information «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}OS      :  "$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-) ${NC}         
echo -e "  ${RB}♦️${NC} ${YB}KERNEL  :  $(uname -r) ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}UPTIME  :  $uptime ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}CPU     :  ${cores}cores @${freq}MHz (${cpu_usage}) ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}RAM     :  ${uram}MB / ${tram}MB ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}DOMAIN  :  $domain ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}NS-HOST :  $(cat /root/nsdomain) ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}IP      :  $IPVPS ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}IPSVPS  :  $ISPVPS ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}CLIENT  :  $Name ${NC} "
echo -e "  ${RB}♦️${NC} ${YB}EXP     :  $exp ($exp2 days) ${NC} "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}»»» SSH/XRAYS Menu «««${NC}          "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}01.${NC} ${YB}SSH WEBSOCKET   $WB[${ssh1} User] ${NC}"
echo -e "  ${RB}02.${NC} ${YB}XRAY VMESS WS   $WB[${vma} User] ${NC}"
echo -e "  ${RB}03.${NC} ${YB}XRAY VLESS WS   $WB[${vla} User] ${NC}"
echo -e "  ${RB}04.${NC} ${YB}XRAY TROJAN WS  $WB[${tra} User] ${NC}"
echo -e "  ${RB}05.${NC} ${YB}XRAY TRIAL WS ${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
echo -e "   ${BICyan}     STUNNEL ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                   ${WB}»»» VPS Menu «««${NC}                 "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}06.${NC} ${YB}SETTING VPS ${NC}          ${RB}66.${NC} ${YB}INSTALL TCP BBR ${NC}"
echo -e "  ${RB}07.${NC} ${YB}BACKUP/RESTORE ${NC}       ${RB}77.${NC} ${YB}INSTALL BBR+ 5.15 ${NC}"
echo -e "  ${RB}08.${NC} ${YB}SET REBOOT ${NC}           ${RB}88.${NC} ${YB}XRAYCORE LATEST 1.8.4 ${NC}"       
echo -e "  ${RB}09.${NC} ${YB}ADD DOMAIN/HOST ${NC}      ${RB}99.${NC} ${YB}FIX UPDATE ${NC}"      
echo -e "  ${RB}10.${NC} ${YB}ADD NS-DOMAIN ${NC}     "
echo -e "  ${RB}11.${NC} ${YB}RENEW CERT XRAYS ${NC}  "    
echo -e ""
echo -e "  ${RB}12.${NC} ${YB}CHECK VPN PORT ${NC}"
echo -e "  ${RB}13.${NC} ${YB}CHECK VPN STATUS ${NC}"
echo -e "  ${RB}14.${NC} ${YB}CHECK CPU & RAM ${NC}"
echo -e "  ${RB}15.${NC} ${YB}CHECK BANDWIDTH ${NC}"
echo -e "  ${RB}16.${NC} ${YB}DNS CHANGER ${NC}"
echo -e "  ${RB}17.${NC} ${YB}NETFLIX CHECKER ${NC}"
echo -e "  ${RB}18.${NC} ${YB}CLEAR CACHE/RAM ${NC}"
echo -e "  ${RB}19.${NC} ${YB}CLEAR EXP USERS ${NC}"
echo -e "  ${RB}20.${NC} ${YB}SPEEDTEST VPS ${NC}"
echo -e "  ${RB}21.${NC} ${YB}RESTART VPN SERVICE ${NC}"
echo -e "  ${RB}22.${NC} ${YB}REBOOT ${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}»»» Total Bandwidth «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Daily Data Usage    : $ttoday ${NC}"
echo -e "  ${RB}♦️${NC} ${YB}Monthly Data Usage  : $tmon ${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "${WB}"
read -p "Select From Options [ 1 - 99 ] : " menu
case $menu in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-trial ;;
6) clear ; menu-set ;;
7) clear ; menu-backup ;;
8) clear ; jam ;;
9) clear ; add-host ;;
10) clear ; slow ;;
11) clear ; genssl ;;
12) clear ; cat log-install.txt ;;
13) clear ; running ;;
14) clear ; htop ;;
15) clear ; vnstat ;;
16) clear ; dns1 ;;
17) clear ; netf ;;
18) clear ; clearcache ;;
19) clear ; delete && xp ;;
20) clear ; speedtest ;;
21) clear ; restart ;;
22) clear ; reboot ;;
66) clear ; bbr3 ;;
77) clear ; bbr4 ;;
88) clear ; mv /usr/local/bin/xray /usr/local/bin/xray.bakk && wget -q -O /usr/local/bin/xray "https://github.com/NevermoreSSH/Xcore-custompath/releases/download/Xray-linux-64-v1.8.4/Xray-linux-64-v1.8.4" && chmod 755 /usr/local/bin/xray && xray version ;;
99) clear ; up ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
