#!/bin/bash
# Install Wallpaper-aerial

if [ ! $(id -u) = 0 ]; then
	echo "Must be run as root."
	exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init --recursive

sudo apt-get install -y xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev

cd $DIR
cd xwinwrap
make
sudo make install
cd ..
sudo cp atv4wall /usr/bin/atv4wall && chmod a+x /usr/bin/atv4wall
sudo cp vid.py /usr/bin/vid.py && chmod a+x /usr/bin/vid.py
read -n1 -p "Autostart Aerial Wallpaper? (y/N)"
echo $USER
if [[ $REPLY == [yY] ]]; then
	mkdir -p $HOME/.config/autostart
	cp aerial-wallpaper.desktop $HOME/.config/autostart
      chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart
      chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart/aerial-wallpaper.desktop
else
	rm -f $HOME/.config/autostart/aerial-wallpaper.desktop
fi
sudo ./download.sh
