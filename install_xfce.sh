
apt update 
apt install -y xfce4 xfce4-goodies  dbus-x11 x11-xserver-utils
mkdir -p /root/.themes || true 
wget https://raw.githubusercontent.com/vinceliuice/WhiteSur-gtk-theme/refs/heads/master/release/WhiteSur-Dark-solid-nord.tar.xz  -O /root/.themes/WhiteSur-Dark-solid-nord.tar.xz && cd  /root/.themes && tar -xf WhiteSur-Dark-solid-nord.tar.xz && rm WhiteSur-Dark-solid-nord.tar.xz
mkdir -p /root/.config/autostart

echo "Creating startup script ...."
echo -n '
[Desktop Entry]
Type=Application
Exec=/root/.autostart.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=My Startup Script
Comment=Run script at startup
' > /root/.config/autostart/autostart.desktop
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git && cd WhiteSur-icon-theme && bash install.sh && rm -rf WhiteSur-icon-theme
echo -n '
xfconf-query -c xsettings -p /Net/IconThemeName -s "WhiteSur-dark" 
xfconf-query -c xsettings -p /Net/ThemeName -s "WhiteSur-Dark-solid-nord"
'> /root/.autostart.sh
chmod +x /root/.autostart.sh
curl -L -o /usr/share/backgrounds/xfce/xfce-verticals.png https://c0.wallpaperflare.com/preview/866/660/860/white-house-and-body-of-water.jpg
mkdir -p /root/.config/xfce4
echo -n '
TerminalEmulator=xfce4-terminal
TerminalEmulatorDismissed=true
' >  /root/.config/xfce4/helpers.rc

echo -n '
startxfce4
' >> /root/.vnc/xstartup && chmod +x ~/.vnc/xstartup

