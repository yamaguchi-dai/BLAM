#!/usr/bin/env bash
/usr/local/bin/composer create-project --prefer-dist laravel/laravel /vagrant/LaraApp/ "5.5.*"
sudo su - postgres -c "psql -c \"CREATE ROLE vagrant LOGIN PASSWORD 'vagrant'\""
sudo su - postgres -c "psql -c \"create database vagrant owner vagrant\""


sudo sh /vagrant/init/init.conf.sh
sudo systemctl restart httpd
sudo systemctl restart postgresql-10

sudo sh /vagrant/init/init.env.sh
