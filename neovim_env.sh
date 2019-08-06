#! /bin/bash 

#set -e
# udpate list

sudo apt-get -y install neovim
curl -sLf https://spacevim.org/install.sh | bash
mkdir -p  ~/.SpaceVim.d/autoload/
cp ./init.toml ~/.SpaceVim.d/init.toml
cp ./myspacevim.vim ~/.SpaceVim.d/autoload/



