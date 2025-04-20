#!/bin/ash
# Installation script by ARYO.

opt=/opt/marzban
sub=/var/lib/marzban/templates/subscription
var=/var/lib/marzban
URL=https://raw.githubusercontent.com/aryobrokollyy/panxray/main
MAX_RETRIES=3

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

download_file() {
    local dest=$1
    local src=$2
    local retries=0

    while [ $retries -lt $MAX_RETRIES ]; do
        wget -O "$dest" "$src"
        if [ $? -eq 0 ] && [ -s "$dest" ]; then
            chmod +x "$dest"
            return 0
        fi
        echo "Gagal mengunduh $src, mencoba ulang... ($((retries + 1))/$MAX_RETRIES)"
        retries=$((retries + 1))
        sleep 2
    done

    echo "Gagal mengunduh $src setelah $MAX_RETRIES percobaan. Menghentikan instalasi."
    exit 1
}

download_files() {
    clear
    echo "Downloading files from repo hilink mak cling..."

    download_file "$sub/index.html" "$URL/index.hml"
    download_file "$var/xray_config.json" "$URL/config.json"
    download_file "$opt/.env" "$URL/env.example"
    download_file "$opt/nginx.conf" "$URL/nginx.conf"
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
