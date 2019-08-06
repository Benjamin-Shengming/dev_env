#Download base image ubuntu latest 
FROM ubuntu:latest
MAINTAINER Ben


ENV HOME /root 
RUN apt-get -y update 
RUN apt-get -y install sudo
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
COPY * $HOME/
#COPY init.toml $HOME/
#COPY myspacevim.vim $HOME/
#COPY general.sh $HOME/
#COPY neovim_env.sh $HOME/
#COPY php_env.sh $HOME/
#COPY python_env.sh $HOME/
#COPY web_env.sh $HOME/
#COPY dev.sh $HOME/

RUN cd $HOME && ./dev.sh
ENTRYPOINT /bin/bash
