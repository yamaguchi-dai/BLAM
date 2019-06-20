#!/usr/bin/env bash

#httpdの設定変更
#backアップ作成
sudo cp /etc/httpd/conf/httpd.conf /vagrant/init/conf/httpd.conf.org
#alias無効化（上書き確認を無効化) 設定ファイル上書き
sudo \cp -f /vagrant/init/conf/httpd.conf /etc/httpd/conf/httpd.conf

#postgresql
sudo cp /var/lib/pgsql/10/data/postgresql.conf /vagrant/init/conf/postgresql.conf.org
sudo \cp -f /vagrant/init/conf/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf

sudo cp /var/lib/pgsql/10/data/pg_hba.conf /vagrant/init/conf/pg_hba.conf.org
sudo \cp -f /vagrant/init/conf/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf