#!/usr/bin/env bash
#LaravelÇÃê›íË
sed -i -E "s/DB_CONNECTION=mysql/DB_CONNECTION=pgsql/" /vagrant/LaraApp/.env
sed -i -E "s/DB_HOST=127.0.0.1/DB_HOST=127.0.0.1/" /vagrant/LaraApp/.env
sed -i -E "s/DB_PORT=3306/DB_PORT=5432/" /vagrant/LaraApp/.env
sed -i -E "s/DB_DATABASE=homestead/DB_DATABASE=vagrant/" /vagrant/LaraApp/.env
sed -i -E "s/DB_USERNAME=homestead/DB_USERNAME=vagrant/" /vagrant/LaraApp/.env
sed -i -E "s/DB_PASSWORD=secret/DB_PASSWORD=vagrant/" /vagrant/LaraApp/.env
