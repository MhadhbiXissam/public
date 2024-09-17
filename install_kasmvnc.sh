apt install -y x11-apps wget libgomp1 libgbm1 libgl1 libpixman-1-0 libunwind8 libxcursor1 libxfixes3 libxfont2 libxrandr2 libxshmfence1 libxtst6 x11-xkb-utils xkb-data
wget http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp7_1.2.4-0.2+deb12u1_amd64.deb 
dpkg -i libwebp7_1.2.4-0.2+deb12u1_amd64.deb 
apt-get install -f && rm libwebp7_1.2.4-0.2+deb12u1_amd64.deb  
apt --fix-broken install
apt install -y xauth libwebp7 ssl-cert libswitch-perl libyaml-tiny-perl  libdatetime-timezone-perl liblist-moreutils-perl libhash-merge-simple-perl
wget https://github.com/kasmtech/KasmVNC/releases/download/v1.3.0/kasmvncserver_bookworm_1.3.0_amd64.deb
dpkg -i kasmvncserver_bookworm_1.3.0_amd64.deb 
apt --fix-broken install
rm kasmvncserver_bookworm_1.3.0_amd64.deb
