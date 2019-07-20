#!/usr/bin/env bash

#httpd�̐ݒ�ύX
#back�A�b�v�쐬
sudo cp /etc/httpd/conf/httpd.conf /vagrant/init/conf/httpd.conf.org
#alias�������i�㏑���m�F�𖳌���) �ݒ�t�@�C���㏑��
sudo \cp -f /vagrant/init/conf/httpd.conf /etc/httpd/conf/httpd.conf

#postgresql
sudo cp /var/lib/pgsql/10/data/postgresql.conf /vagrant/init/conf/postgresql.conf.org
sudo \cp -f /vagrant/init/conf/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf

sudo cp /var/lib/pgsql/10/data/pg_hba.conf /vagrant/init/conf/pg_hba.conf.org
sudo \cp -f /vagrant/init/conf/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf