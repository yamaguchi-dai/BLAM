#!/usr/bin/env bash

sudo su - postgres -c "psql -c \"CREATE ROLE vagrant LOGIN PASSWORD 'vagrant'\""
sudo su - postgres -c "psql -c \"create database vagrant owner vagrant\""

#httpdの設定変更
#backアップ作成
sudo cp /etc/httpd/conf/httpd.conf /vagrant/init/conf/httpd.conf.org
#alias無効化（上書き確認を無効化) 設定ファイル上書き
sudo cp -f /vagrant/init/conf/httpd.conf /etc/httpd/conf/httpd.conf

#postgresql
sudo cp /var/lib/pgsql/10/data/postgresql.conf /vagrant/init/conf/postgresql.conf.org
sudo cp -f /vagrant/init/conf/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf

sudo cp /var/lib/pgsql/10/data/pg_hba.conf /vagrant/init/conf/pg_hba.conf.org
sudo cp -f /vagrant/init/conf/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf

sudo systemctl restart httpd
sudo systemctl restart postgresql-10


cp /vagrant/LaraApp/.env.example /vagrant/LaraApp/.env

cd /vagrant/LaraApp;/usr/local/bin/composer update
php /vagrant/LaraApp/artisan key:generate

#Laravelの設定
sed -i -E "s/DB_CONNECTION=mysql/DB_CONNECTION=pgsql/" /vagrant/LaraApp/.env
sed -i -E "s/DB_HOST=127.0.0.1/DB_HOST=127.0.0.1/" /vagrant/LaraApp/.env
sed -i -E "s/DB_PORT=3306/DB_PORT=5432/" /vagrant/LaraApp/.env
sed -i -E "s/DB_DATABASE=homestead/DB_DATABASE=vagrant/" /vagrant/LaraApp/.env
sed -i -E "s/DB_USERNAME=homestead/DB_USERNAME=vagrant/" /vagrant/LaraApp/.env
sed -i -E "s/DB_PASSWORD=secret/DB_PASSWORD=vagrant/" /vagrant/LaraApp/.env
