
#!/bin/bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"





# run things that exit
xset r rate 350 50 # keboard rate up
setxkbmap -option # clear keyboard options
setxkbmap -option caps:swapescape # swap caps and escape
setxkbmap gb



run "xscreensaver -nosplash" # start screensaver
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
numlockx on
run "com.github.davidmhewitt.clipped"


# screens sometimes doesnt run when it does not find one of the monitors
# it is very important that screens runs before variety so this will slowly spam screens until it works
sleep 5;
screens
while [ $? != 0 ];do
    sleep 5
    notify-send "screens didnt run"
    screens
done

run "nitrogen --restore"

# for some reason this hangs
run "xfce4-power-manager"

#
#run "discord"
#run "signal-desktop"


#run "conky -c $HOME/.config/awesome/system-overview"
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#run applications from startup
#run "firefox"
#run "atom"
#run "dropbox"
#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"
