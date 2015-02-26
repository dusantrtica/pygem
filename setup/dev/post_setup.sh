# THESE NEED USER INPUT -- Cannot do with shell provisining
sudo -u postgres createuser -DAP pygemuser
sudo -u postgres createdb -O pygemuser pygemdb

# Django static files, no need for that.

# Django syncdb/South
source /home/vagrant/venv/bin/activate

app/pygem/manage.py schemamigration employees --initial
app/pygem/manage.py migrate employees

app/pygem/manage.py schemamigration courses --initial
app/pygem/manage.py migrate courses

app/pygem/manage.py schemamigration positions --initial
app/pygem/manage.py migrate positions

app/pygem/manage.py schemamigration education --initial
app/pygem/manage.py migrate education

# This goes after south
app/pygem/manage.py syncdb

# Java
sudo apt-get -y install software-properties-common python-software-properties
sudo add-apt-repository ppa:webupd8team/java # USER INPUT!!
sudo apt-get -y update
sudo apt-get -y install oracle-java7-installer # USER INPUT

# ElasticSearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.3.deb
sudo dpkg -i elasticsearch-1.4.3.deb

# Supervisor Daemon
sudo cp /home/vagrant/app/setup/dev/supervisor.conf /etc/supervisord.conf
sudo mkdir /etc/supervisor-scripts
sudo cp /home/vagrant/app/setup/dev/supervisor-scripts/gunicorns.ini /etc/supervisor-scripts/gunicorns.ini

sudo cp /home/vagrant/app/setup/supervisord.sh /etc/init.d/supervisord
sudo chmod +x /etc/init.d/supervisord
sudo update-rc.d supervisord defaults

# NGINX
sudo apt-get -y install nginx
sudo cp /home/vagrant/app/setup/dev/nginx_config /etc/nginx/sites-available/pygem-dev
sudo ln -s /etc/nginx/sites-available/pygem-dev /etc/nginx/sites-enabled/pygem-dev
# set user for nginx process
sudo sed -i 's/www-data/vagrant/' /etc/nginx/nginx.conf
sudo service nginx restart

sudo supervisorctl restart all

sudo reboot


