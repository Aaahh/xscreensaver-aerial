# wallpaper-aerial
An wallpaper that randomly selects one of the Apple TV4 HD aerial movies and plays it using mpv. 
* Chnages unity theme color to average video color
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.

# Dependencies
* coreutils
* mpv
* ffmpeg
* ImageMagick

# Installation
Download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location. Make sure that you have `wget` installed prior to running the script:
```
./download.sh
```
```
cd xwinwrap
make
sudo make install
cd ..
cp atv4wall /usr/bin/atv4wall && chmod a+x /usr/bin/atv4wall
```

Now you can run it with `atv4wall` in bash. Enjoy!
