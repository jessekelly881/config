# program aliases
alias cat="bat"
alias du="ncdu --color dark"
alias mount=". /home/jesse/.config/scripts/mount.sh"
alias conf="yadm ls-tree --name-only -r HEAD $HOME | fzf --prompt \"Open config file: \" --height 60% --color=bw --reverse --border --preview 'bat {}' | xargs -r emacsclient -t"

# quick access
alias c="clear"
alias C="yadm"
alias t="touch"
alias e="$EDITOR"
alias ed="emacs --daemon --no-window-system -fg '$color1' &"
alias g="git"
alias r="ranger"
alias o="rifle" #Open
alias s="sudo"
alias h='history'
alias H='history | grep'
alias k="pkill"
alias y="yay"
alias yi="yay -S"
alias q="exit"
alias Q="echo \"Shutting Down..\"; sudo -k shutdown now"
alias x="sudo systemctl suspend-then-hibernate"

# useful shortcuts
alias note="$EDITOR /home/jesse/docs/notes.org"
alias cpass="openssl rand -base64 20"
alias news="newsboat"

# accounting
export LEDGER_FILE="$HOME/docs/personal/accounting/transactions.ledger"
alias led="ledger -f $LEDGER_FILE"
alias networth="ledger -f $LEDGER_FILE balance Assets Liabilities"
alias expenses="ledger -f $LEDGER_FILE balance Expenses"

# web stuff
alias serve="python -m SimpleHTTPServer 8000"
alias ipg="curl ipinfo.io/ip"
alias up="ping -q -w 1 -c 1 `ip r | grep -m 1 default | cut -d ' ' -f 3` >/dev/null && echo 'Connected' || echo 'Not Connected'"

# better colors
if [[ -x `which grc` ]]; then
	  alias grc='grc --colour=auto'
	  alias ping='grc ping -c 3'
	  alias last='grc last'
	  alias netstat='grc netstat'
	  alias traceroute='grc traceroute'
	  alias diff='grc diff'
	  alias gcc='grc gcc'
	  alias configure='grc configure'
	  alias cvs='grc cvs'
	  alias gcc='grc gcc'
	  alias configure='grc ./configure'
fi
