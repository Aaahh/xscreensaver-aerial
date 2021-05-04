#!/bin/bash
# Install Wallpaper-aerial

# if [ ! $(id -u) = 0 ]; then
# 	echo "Must be run as root."
# 	exit 1
# fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init --recursive

sudo apt-get install -y xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev mpv python3-dev python2-dev

cd $DIR
cd xwinwrap
make
sudo make install
cd ..
mkdir -p /usr/lib/atvvid
mkdir -p $HOME/.config/atv4wall/vid2
mkdir -p $HOME/.mozilla/native-messaging-hosts
sudo cp atv4wall /usr/bin/atv4wall
sudo chmod a+x /usr/bin/atv4wall
python2 -m pip install pycairo
python2 -m pip install PyGObject
sudo cp vid /usr/bin/atvvid
sudo chmod a+x /usr/bin/atvvid
sudo cp vid2 /usr/lib/atvvid/vid2
sudo chmod a+x /usr/lib/atvvid/vid2
cp fxvid.json $HOME/.mozilla/native-messaging-hosts/fxvid.json
sudo cp wallvid.png /usr/lib/atvvid/
sudo chmod a+r /usr/lib/atvvid/*.png

read -n1 -p "Autostart Aerial Wallpaper? (y/N)"
echo "
$USER"
if [[ $REPLY == [yY] ]]; then
	mkdir -p $HOME/.config/autostart
	cp aerial-wallpaper.desktop $HOME/.config/autostart
      chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart
      chown $SUDO_USER:$SUDO_USER $HOME/.config/autostart/aerial-wallpaper.desktop
else
	rm -f $HOME/.config/autostart/aerial-wallpaper.desktop
fi
sudo ./download.sh