#! /bin/bash

# install python
sudo apt install -y python3-pip

# install python
sudo pip3 install -U setuptools
sudo pip3 install 'python-language-server'

sudo pip3 install neovim
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo ln -s /usr/bin/pip3 /usr/bin/pip

