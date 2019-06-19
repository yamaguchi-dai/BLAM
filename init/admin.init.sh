#!/usr/bin/env bash
cd /vagrant/LaraApp;composer require encore/laravel-admin
php /vagrant/LaraApp/artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
php /vagrant/LaraApp/artisan admin:install
