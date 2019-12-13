set -e
source "$HOME/.config/zsh/utils.sh"

fname=$(basename "$1")
ext="${fname##*.}"

prompt_action () {
    echo "Notify On Change\nTest" | prompt "No Default Action. What To Do?";
}

notify-send "Selected File: $1"
case "$ext" in
    ts) tsc "$1" --watch ;;
    *) prompt_action ;;
esac
