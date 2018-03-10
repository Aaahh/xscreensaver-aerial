# Wallpaper-Aerial
[![forthebadge](http://forthebadge.com/badges/made-with-crayons.svg)](http://forthebadge.com)

An wallpaper that randomly selects from a list of videos including the Apple TV4 HD aerial vidoes and plays it using mpv. 
* Changes background to last frame of video while process is running
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.
* Plays current youtube video on click: https://addons.mozilla.org/en-US/firefox/addon/wallpaper-background-xwinwrap/

## Dependencies
* coreutils
* mpv
* ffmpeg

## Installation
Download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location. Make sure that you have `wget` installed prior to running the script:
```
sudo ./install.sh
```

Now you can run it with `atv4wall` in bash. Enjoy!
