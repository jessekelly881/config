if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# editor
export EDITOR="emacsclient -t"

# performance
export TZ=:/etc/localtime # https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/

# java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Gradle path
GRADLE_VERSION=4.10.2
export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/opt/tools:/opt/gradle/gradle-"$GRADLE_VERSION"/bin

# Scripts path
export PATH=$PATH:$HOME/.gitscripts
export PATH=$PATH:$HOME/.scripts

export DENO_INSTALL="/home/jesse/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/home/jesse/.gem/ruby/2.7.0/bin:$PATH"

// Local NPM
export PATH="$HOME/.npm-global/bin/:$PATH"

// Nix
. ~/.nix-profile/etc/profile.d/nix.sh

#Source Color Scheme.
source "$HOME/.cache/wal/colors.sh"

# autojump
source /etc/profile.d/autojump.zsh

# less color codes(make less pretty)
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

fortune -a
