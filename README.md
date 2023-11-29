<p align="center">

# SCRIPT XRAY-SIMPLY MULTI PORT 443/80 
- ***Script XRAY Multi Port 443/80 By ARYO***
- ***SCRIPT UNTUK MEMBUAT SERVER VPN PREMIUM***
#

# FITUR XRAY TLS
- TROJAN WS        : **443**
- TROJAN GRPC      : **443**
- VMESS WS         : **443**
- VMESS GRPC       : **443**

# FITUR XRAY HTTP
- VMESS WS         : **80**

# MOD List & Updated!
- Pengoptimalan Menu
- Menambahkan Tambah Domain Sebelum Install
- Pemisahan pembuatan dan penghapusan masing-masing akun service
- penambahan masa aktif/rennew akun
- penambahan cek akun
- Add auto Expired
- dll

# OS Linux
- Debian 9 (HVM)
- Debian 10 (Tested KVM)
* Berhasil di gunakan di vps Herza dan os debian 10
* untuk vps isp yg lain saya tidak tau, dan os yg lain juga saya tidak tau (belum coba)

# Syarat && Bahan Untuk Menggunakan Script Ini
- Wajib Punya VPS
- Wajib Punya Akun Cloudflare
- Wajib Punya Domain Punya Kamu Sendiri
- ***Jika semua syarat dan Bahan sudah terpenuhi, silahkan di coba script ini***

# Cara Install Script Nya
- Login ke VPS kamu ( wajib pake user ***root***)
1. MASUK KE VPS LALU KETIK
```
sudo su
```
***Jika tidak bisa lanjut ke script dibawah***

2. Update Dulu VPS NYA

```
apt update -y && apt upgrade -y --fix-missing && update-grub && sleep 1 && reboot
```
- Otomatis Akan Reboot / Hidupkan Ulang

3. Login Lagi Ke VPS NYA

4. Salin kode di bawah ini dan paste kan ke dalam vps punya kamu
- maka proses install akan berjalan, jangan keluar dari vps
- jika keluar dari vps saat lagi proses install, maka akan gagal
  
```
apt update -y && apt install wget screen -y && wget -q https://raw.githubusercontent.com/saputribosen/XRAY-WS/main/setup.sh && chmod +x setup.sh && screen -S setup ./setup.sh
```

5. jika sudah selesai,lalu ketik menu untuk menampilkan menu

```
menu
```
7. DONE / SELESAI

# Cara Perbaiki / FIXING
- ***NOTE***
- jika xray dan nginx mengalami error !
- ketik
```
certxray
```
lalu ketik
```
restart-xray
```

# PENTING! INFO KODE BERIKUT
- menu (untuk menampilkan menu modif )
- updatedll (untuk update script)
- restart-xray (hidupkan ulang xray)
- certv2ray / certxray (Perbarui Sertifikat / Update Certificate)


# DONASI
- ***Silahkan Donasi Seiklasnya***
<img src="https://github.com/aryobrokolly/XRAY-MPORT/blob/26495331210caf0380909a4478a7b3721e04124c/img/qris.jpg" alt="DONASI" width="350" height="470">
