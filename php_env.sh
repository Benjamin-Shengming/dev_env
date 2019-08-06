#! /bin/bash 

#set -e
# udpate list

export DEBIAN_FRONTEND=noninteractive 
sudo apt-get -y install php-cli 
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php  --install-dir=/usr/bin  --filename=composer
php -r "unlink('composer-setup.php');"

composer require jetbrains/phpstorm-stubs dev-master
composer require --dev vimeo/psalm
composer require felixfbecker/language-server
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
