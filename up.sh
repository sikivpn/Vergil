#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf menu
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf cf
rm -rf menu-ssh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf up
rm -rf genssl
rm -rf slow
# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu.sh"
wget -O genssl "https://raw.githubusercontent.com/sikivpn/Vergil/main/ssh/genssl.sh"
wget -O menu-trial "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-trojan.sh"
wget -O cf "https://raw.githubusercontent.com/sikivpn/Vergil/main/cf.sh"
wget -O slow "https://raw.githubusercontent.com/sikivpn/Vergil/main/slow.sh"

# menu ssh ovpn
wget -O menu-ssh "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/sikivpn/Vergil/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/sikivpn/Vergil/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/tendang.sh"

# menu system
wget -O menu-set "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/sikivpn/Vergil/main2/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/sikivpn/Vergil/main2/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/sikivpn/Vergil/main2/menu/bw.sh"

# change port
wget -O port-ssl "https://raw.githubusercontent.com/sikivpn/Vergil/main2/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/sikivpn/Vergil/main2/port/port-ovpn.sh"


wget -O xp "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/sikivpn/Vergil/main2/acs-set.sh"

wget -O sshws "https://raw.githubusercontent.com/sikivpn/Vergil/main2/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/sikivpn/Vergil/main2/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/sikivpn/Vergil/main/backup/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/sikivpn/Vergil/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/sikivpn/Vergil/main/backup/restore.sh"

wget -O jam "https://raw.githubusercontent.com/sikivpn/Vergil/main2/jam.sh"
wget -q -O /usr/bin/up "https://raw.githubusercontent.com/sikivpn/Vergil/main/up.sh" && chmod +x /usr/bin/up
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/sikivpn/Vergil/main/menu/fix.sh" && chmod +x /usr/bin/fix
#wget https://raw.githubusercontent.com/sikivpn/Vergil/main/autoscript-ssh-slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh

chmod +x menu
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x fix
chmod +x up

chmod +x slow
chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x genssl
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw

chmod +x port-ssl
chmod +x port-ovpn

chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x jam

#update
apt install htop -y
apt install vnstat -y
apt install resolvconf -y
echo "0 1 * * * root delete" >> /etc/crontab
echo "0 2 * * * root xp" >> /etc/crontab
echo "0 5 * * * root clearcache" >> /etc/crontab
echo "0 3 * * * root /usr/bin/xp" >> /etc/crontab
echo "0 4 * * * root /usr/bin/delete" >> /etc/crontab

echo -e " [INFO] Update Successfully"
sleep 2
exit
