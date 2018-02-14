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
sudo ./download.sh