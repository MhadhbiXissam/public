NIM_VERSION=1.0.8
wget "https://nim-lang.org/download/nim-$NIM_VERSION-linux_x64.tar.xz" -O /tmp/nim-$NIM_VERSION-linux_x64.tar.xz
cd /tmp/ && tar -xf nim-$NIM_VERSION-linux_x64.tar.xz
cd /tmp/nim-$NIM_VERSION && bash build.sh
cd /tmp/nim-$NIM_VERSION && bash install.sh /opt
cp -r /tmp/nim-$NIM_VERSION/bin /opt/nimble
cd /tmp && rm -rf /tmp/nim-$NIM_VERSION
cd /tmp && rm nim-$NIM_VERSION-linux_x64.tar.xz
