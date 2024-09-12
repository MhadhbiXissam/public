NIM_VERSION=1.0.8
wget "https://nim-lang.org/download/nim-$NIM_VERSION-linux_x64.tar.xz" -O /tmp/nim-$NIM_VERSION-linux_x64.tar.xz
cd /tmp/ && tar -xf nim-$NIM_VERSION-linux_x64.tar.xz
cd /tmp/nim-$NIM_VERSION && bash build.sh
cd /tmp/nim-$NIM_VERSION && bash install.sh /opt
mkdir /opt/nimble/bin || true 
cp  /tmp/nim-$NIM_VERSION/bin/nimble /opt/nimble/bin/nimble
cd /tmp && rm -rf /tmp/nim-$NIM_VERSION
cd /tmp && rm nim-$NIM_VERSION-linux_x64.tar.xz
