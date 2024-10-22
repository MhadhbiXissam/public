


lanchers = [
'''
[Desktop Entry]
Version=1.0
Type=Application
Exec=exo-open --launch FileManager %u
Icon=org.xfce.filemanager
StartupNotify=true
Terminal=false
Categories=Utility;X-XFCE;X-Xfce-Toplevel;
OnlyShowIn=XFCE;
X-XFCE-MimeType=inode/directory;x-scheme-handler/trash;
X-AppStream-Ignore=True
Name=File Manager
Comment=Browse the file system
X-XFCE-Source=file:///usr/share/applications/xfce4-file-manager.desktop
''',
'''
[Desktop Entry]
Version=1.0
Type=Application
Exec=firefox %u
Terminal=false
X-MultipleArgs=false
Icon=firefox
StartupWMClass=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
StartupNotify=true
Actions=new-window;new-private-window;open-profile-manager;
Name=Firefox
Comment=Browse the World Wide Web
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web;Explorer;
X-GNOME-FullName=Firefox Web Browser
X-XFCE-Source=file:///usr/share/applications/firefox.desktop

[Desktop Action new-window]
Exec=firefox --new-window %u
Name=New Window

[Desktop Action new-private-window]
Exec=firefox --private-window %u
Name=New Private Window

[Desktop Action open-profile-manager]
Exec=firefox --ProfileManager
Name=Open Profile Manager
''',
'''
[Desktop Entry]
Version=1.0
Name=Xfce Terminal
Comment=Terminal Emulator
GenericName=Terminal Emulator
Exec=xfce4-terminal
Icon=org.xfce.terminal
Terminal=false
Type=Application
Categories=GTK;System;TerminalEmulator;
StartupNotify=true
Actions=preferences;
X-XFCE-Source=file:///usr/share/applications/xfce4-terminal.desktop

[Desktop Action preferences]
Name=Terminal Preferences
Exec=xfce4-terminal --preferences
''']


import os , random 
for content in lanchers : 
    for index in range(1,120) : 
        folder = f'/root/.config/xfce4/panel/launcher-{index}'
        file = os.path.join(folder,f'{random.randint(1,1000000)}.desktop')
        if not os.path.exists(folder) : 
            os.makedirs(folder)
            print(content , file=open(file, 'w'))
            break 
    

