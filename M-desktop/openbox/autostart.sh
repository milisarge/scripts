#!/bin/bash
# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# xprop -root -remove _NET_NUMBER_OF_DESKTOPS -remove _NET_DESKTOP_NAMES -remove #_NET_CURRENT_DESKTOP
#

/usr/bin/amixer -c 0 sset "Auto-Mute Mode" Disabled
Esetroot -scale ~/images/backgrounds/dragoraman-says-dual.png &
(sleep 2; zarfy  &)&
(sleep 2;fittstool &)&
transmission-gtk &
setxkbmap gb 
claws-mail &
(sleep 2; tint2 &)&
(sleep 4; xterm -e /home/kelsoo/server-up &)&




#(sleep 1; fbpanel  -p left &)&
#(sleep 1; fbpanel  -p right &)&
#(sleep 1; setxkbmap -model pc105 -layout gb -variant ,qwerty &)&
#(sleep 1; fbpanel
#/usr/local/bin/phwmon.py &
#skippy-xd --start-daemon & 







=====8<=====8<===== stolen from salix =====8<======8<======
#xcompmgr -cCfF -o.55 &  #works
#fi
#([ -x /usr/bin/batti ] && dbus-launch batti) &

#key-mon &
#rox --top=pan_MyPanel &
#udisks-glue &
#(setxkbmap -query | grep "^layout:" | sed "s/^layout: *//" | grep -q "," && [ -x /usr/bin/fbxkb ] && fbxkb) &
#(sleep 1 && [ -x /usr/libexec/menu-cached ] && /usr/libexec/menu-cached) &
#(sleep 1 && [ -x /usr/bin/parcellite ] && parcellite) &
#Esetroot -scale ~/images/backgrounds/fittstool-current.png &

#Esetroot -scale ~/images/backgrounds/dragora-gnu-linux-libre.png &
#Esetroot -scale ~/images/backgrounds/utopia-d3.jpg &
#skippy-xd --start-daemon & 
#=====8<=====8<===== not used =====8<======8<======

#(sleep 1;simpleswitcher -bw 4 -bc "#00ff00" -fg "#ffffff" -bg "#444444" -hlfg "#000000" -hlbg "#00ff00"&)&
#(sleep 2; conky &)&
#xautolock -time 2 -locker slock &
#tint2 &
# Start volwheel after a slight delay
#(sleep 1s && volwheel) &
#killall wicd &
#xscreensaver &
#xautolock -time 1 -locker xtrlock &
#(sleep 2; halevt &)&
#(sleep 2; key-mon --backgroundless &)&
#synclient TapButton1=1
#synclient HorizTwoFingerScroll=1
#(sleep 2; xscreensaver &)&
#wicd-client &
#xcompmgr -I1 -O1 -Ff -m.86 &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
#wicd-client &
#Esetroot -s ~/images/backgrounds/frostpatern-black2.jpg &

##This starts rox with no pinbord and no panel
#rox &

## This starts rox and pinpoard using the setting in "Default" config
#rox --pinboard=Default &

## This starts rox and panel with the panel at the top
#rox --top=pan_MyPanel &
#rox --bottom=pan_MyPanel &

##feh 
#feh --bg-scale ~/images/backgrounds/non_title_by_Ryohei_Hase.jpg &
#feh --bg-scale ~/images/backgrounds/frostpatern-black2.jpg &
#feh --bg-scale ~/images/backgrounds/frostpatern-blue.jpg &
#feh --bg-scale ~/images/backgrounds/frostpatern-red.jpg &
#feh --bg-scale ~/images/backgrounds/frostpatern-green.jpg &
#(sleep 2; devmon &)&
#(sleep 2; tilda &)&
#(sleep 2; halevt &)&
#(sleep 2; lxterminal &)&
#(sleep 4; tilda &)&
#sleep 2
#(sleep 1; fbpanel  &)&
#(sleep 2; tint2 &)&
#xbacklight =50 
#transmission &
#lostirc &
#wbar &
#osdsh &
#(sleep 1 && osdctl -m 1) &
#(sleep 1; volwheel &)&
#(sleep 1; fbpanel -p profile1 &)&
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
#tint2 &
#(sleep 2; fbpanel -p profile2 &)&
#(sleep 2; fbpanel -p profile3 &)&
#(sleep 2;trayer --expand true --transparent true  --alpha 255 --edge bottom --align right --expand true --SetDockType true --widthtype request &)&
#(sleep 2; rox  -b=MyPanel &)&
#rox  -b=MyPanel &
#rox –pinboard=MyPinboard -b=MyPanel &
#bbpager &
#bbrun &
#mount /dev/sda2 /media/60gb &
#mount /dev/hda3 /media/80gb &
#mount /dev/hdb3 /media/store &
#xchat &
#pidgin &
#sylpheed &
#xbattbar-acpi -s 2 -p left -I "lightgray" -O "black" &
#xbattbar-acpi &
#conky &
#conky -c ~/.conkyrc2 &
#conky -c ~/.conkyrc3 &

