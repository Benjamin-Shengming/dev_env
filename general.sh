#! /bin/bash 

#set -e
# udpate list
sudo apt-get -y update


# install basic commands
sudo apt-get -y install apt-utils
sudo apt-get -y install software-properties-common
sudo apt-get -y install curl 
sudo apt-get -y install wget
sudo apt-get -y install build-essential 
sudo apt-get -y install make 
sudo apt-get -y install git 
sudo apt-get -y install iproute2 
sudo apt-get -y install ssh 
sudo apt-get -y install sshfs 
sudo apt-get -y install apache2
sudo apt-get -y install autoconf                                                    
sudo apt-get -y install automake                                                    
sudo apt-get -y install cmake                                                       
sudo apt-get -y install fish                                                        
sudo apt-get -y install g++                                                         
sudo apt-get -y install gettext                                                     
sudo apt-get -y install git                                                         
sudo apt-get -y install libtool                                                     
sudo apt-get -y install libtool-bin                                                 
sudo apt-get -y install lua5.3                                                      
sudo apt-get -y install ninja-build                                                 
sudo apt-get -y install pkg-config                                                  
sudo apt-get -y install unzip                                                       
sudo apt-get -y install xclip                                                       
sudo apt-get -y install xfonts-utils                                                
sudo apt-get -y install tmux 
sudo cp .tmux.conf ~/
sudo cp sysctl.conf /etc/sysctl.conf

