#! /bin/bash 

#install clangd c/cpp
sudo apt install gcc 
sudo apt install g++
sudo apt-get -y install clang
sudo apt-get -y install clang-tools 
if ! [ -f /usr/bin/clangd ]; then
  sudo ln -s /usr/bin/clangd-6.0 /usr/bin/clangd
fi
