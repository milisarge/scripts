the-worlds-best-desktop :-)

I'll try and list all my packages so most of it works as per the videos!

I only have 32bit packages so if you on 64bit you may need to build them!

packages needed.

## openbox ##
Note after installing openbox as root you need run 
"cp /etc/X11/xinit/xinitrc.icewm /etc/X11/xinit/xinitrc.openbox"
then "moe /etc/X11/xinit/xinitrc.openbox" and change "icewm-session" to "openbox-session" 
then save the file with F2

to change window manager before loging in run "wmconfig" 

## openbox ##

openbox 3.61
http://gungre.ch/dragora/repo/frusen/stable/openbox/openbox-3.6.1-x86_64-1.tlz  #64bit  
http://openbox.org/wiki/Openbox:Download

openbox menu items:
run (bashrun2)
runner
lilyterm
rox
rox-menu (bookmarks.py)
disk (obbrowser)
dektops
shortcuts

settings: 
obmenu (I'm not sure if I had to build a newer version! wmmv)
http://gungre.ch/dragora/repo/kelsoo/openbox-menu/openbox-menu-0.3.6.8-i486-1.tlz  #32bit
obconf (You need to build version obconf-2.0.4)
obkey https://github.com/nsf/obkey
reconfigure
restart
online help

composting:
xcompmgr 
display settings:
zarfy 
https://sourceforge.net/projects/zarfy/
http://gungre.ch/dragora/repo/kelsoo/zarfy/source/
http://gungre.ch/dragora/repo/kelsoo/zarfy/zarfy-0.1.0-i486-1.tlz  #32bit

calculator (included in fox-toolkit) http://gungre.ch/dragora/repo/kelsoo/fox/fox-1.6.50-i486-1.tlz  #32bit
help  (gtkman http://gungre.ch/dragora/repo/kelsoo/gtkman/gtkman-i486-1.tlz  #32bit)
Dragora home (Link to home page via icecat)
lock (lock screen) btrxtrlock
Note: rmb top centre locks the screen you get not clues except no mouse cursor. You can still see the screen action but notinteract with it until you enter your password. Hit Esc or return and type you user password to unlock.  
http://gungre.ch/dragora/repo/frusen/old-stable/btrxtrlock/btrxtrlock-20141030~git08444b-i486-1.tlz  #32bit
Note: you need to place the script  "btrxtrlock-wrapper" in /usr/local/bin/ for fittstool to use it

## leafpad ##
http://gungre.ch/dragora/repo/kelsoo/leafpad/leafpad-0.8.17-i486-1.tlz  #32bit  

## fbpanel ##

fbpanel
I like to have fbpanel in my openbox menu incase I want to start a dynamic menu. It hidden 15 pixels in from the top left so as to not interfere with fittstool
http://gungre.ch/dragora/repo/kelsoo/fbpanel/fbpanel-6.1-i486-1.tlz  #32bit 

## fittstool ##

fittstool
http://gungre.ch/dragora/repo/frusen/stable/fittstool/fittstool-0.2-i486-1.tlz  #32bit
or
http://gungre.ch/dragora/repo/frusen/stable/fittstool/fittstool-0.2-x86_64-1.tlz  #64bit
read the config for tips! it a killer application

## tint2 and applications for all the bling to work as in kelsoo's video ##

tint2 
https://gitlab.com/o9000/tint2
82b71ec5 Update changelog · about 11 hours ago by o9000
New stable release: 0.12.8
Note:you will need to install/build bwm-ng-0.6.1  before you build tint2

I have included a 32bit version in the dottint2 directory
bwm-ng-0.6.1-i486-1.tlz   #32bit 

gsimplecal
http://dmedvinsky.github.io/gsimplecal/
I have included a 32bit version in the dottint2 directory

lilyterm
http://lilyterm.luna.com.tw/
http://gungre.ch/dragora/repo/kelsoo/lilyterm/lilyterm-0.9.9.2-i486-1.tlz  #32bit

inxi
https://github.com/smxi/inxi
Note: Need lilyterm started first. I run weechat-curses in lilyterm so it's always started
htop
http://gungre.ch/dragora/repo/frusen/old-stable/htop/htop-1.0.2-i486-2.tlz  #32bit
or
http://gungre.ch/dragora/repo/frusen/old-stable/htop/htop-1.0.2-x86_64-2.tlz  #64bit
Note: Need lilyterm started first.  I run weechat-curses in lilyterm so it's always started

## file managers ##

rox-filer 
http://gungre.ch/dragora/repo/frusen/old-stable/rox/rox-2.11-i486-2.tlz  #32bit
or
http://gungre.ch/dragora/repo/frusen/old-stable/rox/rox-2.11-x86_64-2.tlz  #64bit

SpaceFM 1.0.5
http://gungre.ch/dragora/repo/frusen/stable/spacefm/spacefm-1.0.5-i486-1.tlz  #32bit
or
http://gungre.ch/dragora/repo/frusen/stable/spacefm/spacefm-1.0.5-x86_64-1.tlz  #64bit

## auto mounting ##

udevil 
http://gungre.ch/dragora/repo/frusen/stable/udevil/udevil-0.4.4-i486-1.tlz  #32bit
or
http://gungre.ch/dragora/repo/frusen/stable/udevil/udevil-0.4.4-x86_64-1.tlz  #64bit

## run dialogs ##

bashrun2
http://gungre.ch/dragora/repo/kelsoo/bashrun2/bashrun2-0.2.3-i486-1.tlz  #32bit 

runner
http://www.boomerangsworld.de/cms/tools/runner

## Themes ##

GTK gartoon
http://gnome-look.org/content/show.php/Gartoon+Redux?content=74841

openbox
a kelsoo remix called 
Onyx-lessr-red
I have included a version in the openbox directory
put it in ~/.themes

## scripts ##
scripts live in 

~/.openbox/scripts/

for the dynamic filebrowser obbrewser to work in openbox menu see here

https://github.com/trizen/obbrowser

For the rox bookmarks be in the openbox menu you need to enable 
bookmarks.py

see http://openbox.org/wiki/Openbox:Pipemenus
http://icculus.org/openbox/pipemenus/bookmarks.py

the included directorys (openbox, fittstool, tint2, and fbpanel)  need to be placed in the hidden  ~/.config  directory  ctl+h in your home directory to see it
