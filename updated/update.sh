#!/bin/ash
# Installation script by ARYO.

opt=/opt/marzban
sub=/var/lib/marzban/templates/subscription
var=/var/lib/marzban
URL=https://cdn.jsdelivr.net/gh/aryobrokollyy/panxray@main
MAX_RETRIES=5

finish() {
    clear
    echo ""
    echo "INSTALL MARZBAN SUCCESSFULLY ;)"
    echo ""
    echo "Untuk Menjalankan Ketik menu dan enter di terminal"
    sleep 3
    echo ""
    echo "SALAM SEDULURAN"
    echo ""
    echo ""
}
download_files() {
    clear
    echo "Downloading files update marzban..."
    cd $sub
    rm -f index.html
    sleep 1
    wget -O $sub/index.html $URL/index.html
    cd $var
    rm -f xray_config.json
    sleep 1
    wget -O $var/xray_config.json $URL/config.json
    cd $opt
    rm -f .env
    rm -f nginx.conf
    sleep 1
    wget -O $opt/.env $URL/env.example
    wget -O $opt/nginx.conf $URL/nginx.conf
    sleep 1
    marzban restart
    sleep 5
    finish
}

echo ""
echo "Install Script Marzban x Membership from repo aryo."

while true; do
    read -p "This will download the files into $var. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
