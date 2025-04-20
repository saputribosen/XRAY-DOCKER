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
    rm -f update.sh
}
download_file() {
    local dest=$1
    local src=$2
    local retries=0

    while [ $retries -lt $MAX_RETRIES ]; do
        wget -O "$dest" "$src"
        if [ $? -eq 0 ] && [ -s "$dest" ]; then
            return 0
        fi
        echo "Gagal mengunduh $src, mencoba ulang... ($((retries + 1))/$MAX_RETRIES)"
        retries=$((retries + 1))
        sleep 2
        clear
    done
    clear
    echo "Gagal mengunduh $src setelah $MAX_RETRIES percobaan. Menghentikan instalasi."
    exit 1
}
install_files() {
    clear
    echo "Downloading files update marzban..."
    download_file "$sub/index.html" "$URL/index.html"
    cd $sub
    rm -f index.html
    sleep 1
    download_file "$sub/index.html" "$URL/index.html"
    cd $var
    rm -f xray_config.json
    sleep 1
    download_file "$var/xray_config.json" "$URL/config.json"
    cd $opt
    rm -f .env
    rm -f nginx.conf
    sleep 1
    download_file "$opt/.env" "$URL/env.example"
    download_file "$opt/nginx.conf" "$URL/nginx.conf"
    sleep 1
    cd /opt/marzban
    docker compose down && docker compose up -d
    sleep 5
    finish
}

echo ""
echo "Install Script Marzban Membership from repo aryo."

while true; do
    read -p "This will download the files into $var. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) install_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
