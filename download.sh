#!/bin/sh
# run this from /opt/ATV4 which you created and assigned 755 premissions manually

if [ ! $(id -u) = 0 ]; then
	echo "Must be run as root."
	exit 1
fi

dir=/opt/ATV4

if [ ! -d "$dir" ]; then
	mkdir -p "$dir"
fi

url="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
while read -r i 
do
	file=$dir/$i
	if [ ! -f "$file" ]; then
		wget -O "$file" "$url/$i"
		chmod 644 "$file"
	else
		echo "Skipping file \"$file\""
	fi
done < ./resources

exit 0

