# Firejail profile for conky
# Description: Highly configurable system monitor
# This file is overwritten after every install/update
# Persistent local customizations
include conky.local
# Persistent global definitions
include globals.local

noblacklist ${PICTURES}

include disable-devel.inc
include disable-exec.inc
include disable-passwdmgr.inc
include disable-programs.inc
include disable-xdg.inc

include whitelist-usr-share-common.inc

caps.keep net_raw
ipc-namespace
netfilter
no3d
nosound
notv
nou2f
novideo
protocol unix,inet,inet6
seccomp
shell none

disable-mnt
private-cache
private-dev
private-tmp

memory-deny-write-execute
