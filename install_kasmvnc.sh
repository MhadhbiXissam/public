apt install -y libgbm1 libgl1 libpixman-1-0 libunwind8 libxcursor1 libxfixes3 libxfont2 libxrandr2 libxshmfence1 libxtst6 x11-xkb-utils xkb-data
wget http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp7_1.2.4-0.2+deb12u1_amd64.deb
dpkg -i libwebp7_1.2.4-0.2+deb12u1_amd64.deb 
apt-get install -f
rm *.deb
apt --fix-broken install
apt install -y libwebp7 ssl-cert libswitch-perl libyaml-tiny-perl  libdatetime-timezone-perl liblist-moreutils-perl libhash-merge-simple-perl
wget https://github.com/kasmtech/KasmVNC/releases/download/v1.3.0/kasmvncserver_bookworm_1.3.0_amd64.deb
dpkg -i *.deb
rm kasmvncserver_bookworm_1.3.0_amd64.deb