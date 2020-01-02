#!/usr/bin/env bash

set -e

# set variables
COUNTRY=Mexico

# update mirror lists(should improve install speed)
pacman -Sy --noconfirm reflector
reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# setup drive
sgdisk --zap-all $DRIVE

sgdisk --clear \
       --new=1:0:+550MiB --typecode=1:ef00 --change-name=1:EFI \
       --new=2:0:+8GiB   --typecode=2:8200 --change-name=2:cryptswap \
       --new=3:0:0       --typecode=2:8200 --change-name=3:cryptsystem \
         $DRIVE

mkfs.fat -F32 -n EFI /dev/disk/by-partlabel/EFI

# setup luks
cryptsetup luksFormat --align-payload=8192 -s 256 -c aes-xts-plain64 /dev/disk/by-partlabel/cryptsystem
cryptsetup open /dev/disk/by-partlabel/cryptsystem system
cryptsetup open --type plain --key-file /dev/urandom /dev/disk/by-partlabel/cryptswap swap

# setup swap
mkswap -L swap /dev/mapper/swap
swapon -L swap

# create btrfs file system
mkfs.btrfs --force --label system /dev/mapper/system

o=defaults,x-mount.mkdir
o_btrfs=$o,compress=lzo,ssd,noatime

mount -t btrfs LABEL=system /mnt

# create btrfs subvolumes
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/snapshots

# unmount and then remount as btrfs
umount -R /mnt
mount -t btrfs -o subvol=root,$o_btrfs LABEL=system /mnt
mount -t btrfs -o subvol=home,$o_btrfs LABEL=system /mnt/home
mount -t btrfs -o subvol=snapshots,$o_btrfs LABEL=system /mnt/.snapshots

# pacstrap
pacstrap /mnt base

# create fstab
genfstab -L -p /mnt >> /mnt/etc/fstab
sed -i "s+LABEL=swap+/dev/mapper/swap" /etc/fstab_labels

# boot into system
systemd-nspawn -bD /mnt

# set locale and datetime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
localectl set-locale LANG=en_US.UTF-8
timedatectl set-ntp 1
timedatectl set-timezone America/Los_Angeles

# set hostname
hostnamectl set-hostname myhostname
echo "127.0.1.1	myhostname.localdomain	myhostname" >> /etc/hosts

# install base packages
pacman -Syu base-devel btrfs-progs iw gptfdisk zsh vim git

# install yay and yadm
git clone https://aur.archlinux.org/yay.git $HOME/dev/clones/yay # install yay
cd $HOME/dev/clones/yay
makepkg -si

yay -S --noconfirm yadm
yadm clone https://github.com/jessekelly881/config
