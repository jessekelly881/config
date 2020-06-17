##
# boot.sh
# Post window manager setup file.
##


##
# Input device config. Change keyboard & mouse config
##
xset r rate 200 40 #Keypress rate
setxkbmap -option caps:swapescape #ESC -> CAPS
xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9" # disable middle curser button. super annoying default behavior
xbanish & # Hide mouse after keypress

##
# Background services
##
xautolock -time 10 -locker "i3lock-fancy -g" &
emacs --daemon --no-window-system -fg "$color1" &
dunst -lb "$color1" -nb "$color2" -hb "$color3" -lf "#000000" -mf "#000000" -bf "#000000" &
remind -z1 -k'notify-send %s &' $HOME/docs/personal/reminders & # reminders
xss-lock -- i3lock-fancy &
conky -c $HOME/.config/conky/system.conf &
conky -c $HOME/.config/conky/personal.conf &
redshift -t 5700:3000 -l 19.43:-99.13 & # cdmx coords

##
# Visual config: shaddows, background images, etc.
##
compton --respect-prop-shadow &
oneko -fg "$color1" -tora -tofocus &
python -m pywal -R &
source "$HOME/.cache/wal/colors.sh" # Source color scheme

##
# Autostart programs
##
urxvt -e tmux attach &

i3-msg "workspace 2"
firefox &

i3-msg "workspace 5"
soulseekqt &
