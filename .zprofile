if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# editor
export EDITOR="emacsclient -t"

# java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Gradle path
GRADLE_VERSION=4.10.2
export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/opt/tools:/opt/gradle/gradle-"$GRADLE_VERSION"/bin

#Source Color Scheme.
source "$HOME/.cache/wal/colors.sh"

fortune -a
