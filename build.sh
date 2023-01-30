#!/bin/bash

wget "https://raw.githubusercontent.com/Tiger-OperatingSystem/alerta-videos/main/alerta-videos"
wget "https://raw.githubusercontent.com/Tiger-OperatingSystem/alerta-videos/main/logoNew.png"

mkdir -p pacote/var/lib/curso-linux/launchers
mkdir -p pacote/var/lib/curso-linux/videos
cp *.desktop pacote/var/lib/curso-linux/launchers
cp *.svg pacote/var/lib/curso-linux/videos
cp curso-linux pacote/var/lib/curso-linux/

mv "alerta-videos" pacote/var/lib/curso-linux/
mv "logoNew.png" pacote/var/lib/curso-linux/

chmod +x pacote/var/lib/curso-linux/curso-linux
chmod +x pacote/var/lib/curso-linux/curso-linux/alerta-videos

mkdir -p pacote/usr/share/applications
mv pacote/var/lib/curso-linux/launchers/curso-linux.desktop pacote/usr/share/applications

mkdir -p pacote/DEBIAN

(
 echo "Package: curso-linux"
 echo "Priority: optional"
 echo "Version: $(date +%y.%m.%d%H%M%S)"
 echo "Architecture: all"
 echo "Maintainer: Natanael Barbosa Santos"
 echo "Depends: yad"
 echo "Description: Micro videoaulas ensinando a usar os recursos do Tiger OS"
 echo
) > "pacote/DEBIAN/control"

dpkg -b pacote
mv pacote.deb curso-linux.deb
