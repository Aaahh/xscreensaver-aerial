# xscreensaver-aerial
An xscreensaver that randomly selects one of the Apple TV4 HD aerial movies and plays it using mpv. 
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.
* No excessive HDD usage. When the display is told to sleep by xscreensaver, whatever video is currently playing will finish and another will NOT get called until the display is active again.

# Dependencies
* coreutils
* mpv
* xscreensaver

# Installation
Download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location. Make sure that you have `wget` installed prior to running the script:
```
./download.sh
```
```
cp atv4.sh /usr/lib/xscreensaver/atv4 && chmod a+x /usr/lib/xscreensaver/atv4
cp ./lightsOn/lightsOn.sh /usr/lib/xscreensaver/lightsOn.sh && chmod a+x /usr/lib/xscreensaver/lightsOn.sh
```

2) Edit ~/.xscreensaver to add support for it to see this script. Look for the line that beings with "programs:" and simply add the following to the file:
```
"ATV4" atv4 \n\
```

Now you can run it with `atv4` in bash. Enjoy!
