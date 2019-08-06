#! /bin/bash 

# install python
sudo apt-get -y install python 
sudo apt-get -y install python-pip
sudo apt-get -y install python3 
sudo apt-get -y install python3-pip 

# install python
sudo pip install -U setuptools
sudo pip install 'python-language-server[all]'
sudo pip3 install -U setuptools
sudo pip3 install 'python-language-server[all]'

sudo pip install neovim 
sudo pip3 install neovim 

