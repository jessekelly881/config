export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export DISPLAY=:0
pkill polybar
sleep 1s
polybar bar -r &
notify-send "Started Polybar"
