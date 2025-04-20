#!/bin/ash
# Installation script by ARYO.

opt=/opt/marzban
sub=/var/lib/marzban/templates/subscription
var=/var/lib/marzban
URL=raw.githubusercontent.com/aryobrokollyy/panxray/main
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

edit_env_file() {
    echo "Mengedit file .env..."
    sed -i 's/SUDO_USERNAME *= *"[^"]*"/SUDO_USERNAME = "aryo"/' "$opt/.env"
    sed -i 's/SUDO_PASSWORD *= *"[^"]*"/SUDO_PASSWORD = "admin1"/' "$opt/.env"
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
    sleep 1
    download_file "$var/xray_config.json" "$URL/config.json"
    sleep 1
    download_file "$opt/.env" "$URL/env.example"
    edit_env_file
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
