#! /bin/bash 

#set -e

# install nvm node
NVM_VERSION=v0.34.0
NODE_VERSION=v10.16.0
curl -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash

source ~/.nvm/nvm.sh && \
nvm install $NODE_VERSION  && \
nvm alias default $NODE_VERSION && \
nvm use default


# Install language servers 
#install javascript
source ~/.bashrc
npm install -g javascript-typescript-langserver 
npm install -g typescript-language-server 
npm install -g bash-language-server --unsafe-perm=true --allow-root
npm install -g vscode-css-languageserver-bin
npm install -g vscode-html-languageserver-bin

