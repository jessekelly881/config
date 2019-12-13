xset r rate 200 40 #Keypress rate
setxkbmap -option caps:swapescape #ESC -> CAPS

compton --respect-prop-shadow &
xbanish &
greenclip daemon &
xautolock -time 2 -locker "i3lock-fancy -g -t 'Incorrect'" &

python -m pywal -R &
source "$HOME/.cache/wal/colors.sh" # Source color scheme

oneko -fg "$color1" -tora -tofocus &
emacs --daemon --no-window-system -fg "$color1" &
dunst -lb "$color1" -nb "$color2" -hb "$color3" -lf "#000000" -mf "#000000" -bf "#000000" &

# Post setup launch programs
urxvt -e tmux attach &
sleep 1s
i3-msg "workspace 2"
google-chrome-stable &
