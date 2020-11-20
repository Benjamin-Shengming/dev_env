#! /bin/bash

#set -e
# udpate list
sudo pacman -Sy update


# install basic commands
sudo pacman -Sy install apt-utils
sudo pacman -Sy install software-properties-common
sudo pacman -Sy install curl
sudo pacman -Sy install wget
sudo pacman -Sy install build-essential
sudo pacman -Sy install make
sudo pacman -Sy install git
sudo pacman -Sy install iproute2
sudo pacman -Sy install ssh
sudo pacman -Sy install sshfs
sudo pacman -Sy install apache2
sudo pacman -Sy install autoconf
sudo pacman -Sy install automake
sudo pacman -Sy install cmake
sudo pacman -Sy install fish
sudo pacman -Sy install g++
sudo pacman -Sy install gettext
sudo pacman -Sy install git
sudo pacman -Sy install libtool
sudo pacman -Sy install libtool-bin
sudo pacman -Sy install lua5.3
sudo pacman -Sy install ninja-build
sudo pacman -Sy install pkg-config
sudo pacman -Sy install unzip
sudo pacman -Sy install xclip
sudo pacman -Sy install xfonts-utils
sudo pacman -Sy install tmux
sudo cp .tmux.conf ~/
sudo cp sysctl.conf /etc/sysctl.conf

