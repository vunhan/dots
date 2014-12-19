#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

## Source .xprofile - Vũ Nhân
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile] && source ~/.xprofile

amixer -c 0 set Speaker 100%
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources         # update x resources db
sleep 10 && xscreensaver -no-splash &         # starts screensaver daemon 
xsetroot -cursor_name left_ptr &
unset GREP_OPTIONS

# Run your window manager from here - Vũ Nhân
exec awesome