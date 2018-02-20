#!/usr/bin/python2
# PRIME Indicator - indicator applet for NVIDIA Optimus laptops
# Copyright (C) 2013 Alfred Neumayer
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

import gtk
import appindicator
import os
import commands
import gtk
import sys
import subprocess

class VidWall:
    def __init__(self):
	self.ind = appindicator.Indicator("Video Wallpaper",
                                           "indicator-messages",
                                           appindicator.CATEGORY_APPLICATION_STATUS)
	self.ind.set_status(appindicator.STATUS_ACTIVE)
	self.ind.set_attention_icon("indicator-messages-new")
	self.ind.set_icon_theme_path("/usr/lib/vidwall/")
	self.isIntegrated = self.checkIntegrated()
	self.ind.set_icon('intel')
	self.menu_setup()
        self.ind.set_menu(self.menu)

    def menu_setup(self):
        self.menu = gtk.Menu()
	self.info_item = gtk.MenuItem(self.rendererString())
	self.info_item.set_sensitive(False)
	self.info_item.show()
	self.seperator_item = gtk.SeparatorMenuItem()
	self.seperator_item.show()
	self.switch_item = gtk.MenuItem("Next Video")
	self.switch_item.connect("activate", self.switchVideo)
	self.switch_item.show()
	self.seperator2_item = gtk.SeparatorMenuItem()
	self.seperator2_item.show()
	self.settings_item = gtk.MenuItem("Start/Stop Wallpaper")
    	self.settings_item.connect("activate", self.opensettings)
        self.settings_item.show()
	self.settings_item2 = gtk.MenuItem("Play/Pause Wallpaper")
        self.settings_item2.connect("activate", self.opensettings2)
        self.settings_item2.show()	
	self.menu.append(self.info_item)
	self.menu.append(self.seperator_item)
	self.menu.append(self.switch_item)
	self.menu.append(self.seperator2_item)
	self.menu.append(self.settings_item2)
	self.menu.append(self.settings_item)

    def opensettings(self, dude):
    	self.isIntegrated = self.checkIntegrated()
    	if self.isIntegrated:
    		os.system("ps aux | egrep '[/]usr/bin/atv4wall'| awk '{print $2}' | xargs kill")
    	else:
    		p = subprocess.Popen(['setsid', 'atv4wall'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT); print('finished')

    def opensettings2(self, dude):
    	os.system("echo 'cycle pause'   | socat - /tmp/mpvsocket")
    	self.info_item = gtk.MenuItem(self.rendererString())

    def checkIntegrated(self):
	stat, out = commands.getstatusoutput("ps aux | egrep '[/]usr/bin/atv4wall' |  awk '{print $2}'")
	return any(char.isdigit() for char in out)

    def ignore(*args):
	return gtk.TRUE

    def rendererString(self):
	stat, out = commands.getstatusoutput("ps aux | grep [/]opt/ATV4/ | awk '{print $23}'")
	out = out.replace("/opt/ATV4/", "Video: ")
	return out

    def switchVideo(self, dude):
	os.system("/usr/bin/killall mpv")
	self.info_item = gtk.MenuItem(self.rendererString())

    def main(self):
        gtk.main()

if __name__ == "__main__":
    indicator = VidWall()
    indicator.main()
