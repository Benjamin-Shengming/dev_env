#! /bin/bash

# install python
sudo pacman -Sy python3-pip

# install python
sudo pip install -U setuptools
sudo pip install 'python-language-server'

sudo pip install neovim
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo ln -s /usr/bin/pip3 /usr/bin/pip

