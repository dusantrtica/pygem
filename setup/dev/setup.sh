#!/bin/sh

# For building packages on ubuntu (MongoDB requires it), and managing packages in general
sudo apt-get -y install build-essential software-properties-common python-software-properties
# For mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get -y update
echo 'installing nginx git pyton, vim and curl...'
sudo apt-get -y install nginx git python-pip vim curl
echo 'installing libs for python'
sudo apt-get -y install libpq-dev python-dev libevent-dev libxml2-dev libxslt1-dev
sudo apt-get -y install libxslt1.1 libxml2 libssl-dev

# Python pin 'n' stuff
echo 'python stuff...'
sudo pip install virtualenv virtualenvwrapper supervisor ipython
cd /home/vagrant
virtualenv venv
~/venv/bin/pip install -r /home/vagrant/app/requirements.txt

# setup mongodb
sudo apt-get install mongodb-org

# setup postgresql and create users and databases
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install bower -g
sudo npm install grunt -g
sudo npm install -g grunt-cli
