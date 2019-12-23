xset r rate 200 40 #Keypress rate
setxkbmap -option caps:swapescape #ESC -> CAPS

compton --respect-prop-shadow &
xbanish &
xautolock -time 10 -locker "i3lock-fancy -g" &
xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9" # disable middle curser button. super annoying default behavior

python -m pywal -R &
source "$HOME/.cache/wal/colors.sh" # Source color scheme

oneko -fg "$color1" -tora -tofocus &
emacs --daemon --no-window-system -fg "$color1" &
dunst -lb "$color1" -nb "$color2" -hb "$color3" -lf "#000000" -mf "#000000" -bf "#000000" &

# Post setup launch programs
urxvt -e tmux attach &
i3-msg "workspace 2"
google-chrome-stable &
conky &

remind -z1 -k'notify-send %s &' $HOME/docs/personal/reminders # reminders
