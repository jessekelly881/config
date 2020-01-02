#!/usr/bin/env bash

set -e

# variables
COUNTRY=Mexico
DRIVE=/dev/sda
HOSTNAME=barcelona
TIMEZONE=America/Mexico_City
USERNAME=jesse

#--------------------------------------------------------------------------------
Install arch
#--------------------------------------------------------------------------------

# setup drive
echo "Setting up drive"
sgdisk --zap-all $DRIVE

sgdisk --clear \
       --new=1:0:+550MiB --typecode=1:ef00 --change-name=1:EFI \
       --new=2:0:+8GiB   --typecode=2:8200 --change-name=2:cryptswap \
       --new=3:0:0       --typecode=2:8200 --change-name=3:cryptsystem \
         $DRIVE

sleep 1s # give it a second to create this file
mkfs.fat -F32 -n EFI /dev/disk/by-partlabel/EFI

# setup luks
echo "Setting up luks drive encryption"
cryptsetup luksFormat --align-payload=8192 -s 256 -c aes-xts-plain64 /dev/disk/by-partlabel/cryptsystem
cryptsetup open /dev/disk/by-partlabel/cryptsystem system
cryptsetup open --type plain --key-file /dev/urandom /dev/disk/by-partlabel/cryptswap swap

# setup swap
echo "Setting up swap"
mkswap -L swap /dev/mapper/swap
swapon -L swap

# create btrfs file system
echo "Creating btrfs file system"
mkfs.btrfs --force --label system /dev/mapper/system

mount -t btrfs LABEL=system /mnt

# create btrfs subvolumes
echo "Creating btrfs sub volumes"
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/snapshots

# unmount and then remount them with btrfs options
echo "Mounting btrfs sub volumes"

o=defaults,x-mount.mkdir
o_btrfs=$o,compress=lzo,ssd,noatime

umount -R /mnt
mount -t btrfs -o subvol=root,$o_btrfs LABEL=system /mnt
mount -t btrfs -o subvol=home,$o_btrfs LABEL=system /mnt/home
mount -t btrfs -o subvol=snapshots,$o_btrfs LABEL=system /mnt/.snapshots

# update mirror lists(should improve install speed)
echo "Installing reflector and updating mirror lists"
pacman -Sy --noconfirm reflector
reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# pacstrap
echo "Running pacstrap"
pacstrap /mnt base

# create fstab
echo "Generating fstab"
genfstab -U -p /mnt >> /mnt/etc/fstab
sed -i s+LABEL=swap+/dev/mapper/swap+ /mnt/etc/fstab
echo "cryptswap        /dev/disk/by-partlabel/cryptswap        /dev/urandom        swap,offset=2048,cipher=aes-xts-plain64,size=256" >> /etc/crypttab

# boot into the system
echo "pts/0" >> /mnt/etc/securetty # should allow root login after booting into system
systemd-nspawn -bD /mnt

#--------------------------------------------------------------------------------
Post install
#--------------------------------------------------------------------------------

# set locale and datetime
echo "Setting locale and datetime"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
timedatectl set-timezone $TIMEZONE
hwclock --systohc --utc

# set hostname
hostnamectl set-hostname $HOSTNAME
echo "127.0.1.1	$HOSTNAME.localdomain	$HOSTNAME" >> /etc/hosts

# set root password
echo "Set root password"
passwd

# create user
useradd -m -g users -G wheel,games,power,optical,storage,scanner,lp,audio,video -s /bin/bash $USERNAME
passwd $USERNAME

# install base packages
echo "Installing base packages"
pacman -Sy base-devel btrfs-progs iw gptfdisk zsh vim git sudo

# install yay and yadm
echo "Installing yay and yadm"
git clone https://aur.archlinux.org/yay.git $HOME/dev/clones/yay # install yay
cd $HOME/dev/clones/yay
makepkg -si

yay -S --noconfirm yadm
yadm clone https://github.com/jessekelly881/config
