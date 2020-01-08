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

#Source Color Scheme.
source "$HOME/.cache/wal/colors.sh"

source /etc/profile.d/autojump.zsh

fortune -a
