#!/usr/bin/env bash

# Generates a 'let me google that for you (lmgt) url'
# Useful when working with idiots
lmgt(){
    URL="$(echo 'http://letmegooglethat.com/?q='$@ | sed -e 's/ /+/g')"
    echo "$(echo $URL )" | xsel -ib
    echo $URL
}

# Change of base
# $1: from base
# $2: to base
# $3: number
base(){
    echo "ibase=$1; obase=$2; $3" | bc
}

speed(){
    speedtest-cli | awk -F ': ' '/Download/{print "↓", $2} /Upload/{print "↑", $2}'
}

movies(){
    curl -s https://cinemex.com/ | pup ".movies-grid-title text{}" | head -n15 | sort
}
