eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec slstatus &
  xcompmgr &
  ~/.fehbg &
  ~/.screenlayout/my-layout.sh &
  mpd &
  mpc update &
  setxkbmap pl &
  xautolock -time 3 -locker i3lock &
  sxhkd &
  dwm
