#!/bin/bash

if [ ! -d /vagrant/logs ]; then
  mkdir /vagrant/logs
fi

usermod -a -G vagrant www-data

cp /vagrant/config/php.ini /etc/php5/apache2/php.ini

if [ -e /etc/apache2/sites-available/silverstripe ]; then
  rm /etc/apache2/sites-available/silverstripe
fi

ln -s /vagrant/config/silverstripe.conf /etc/apache2/sites-available/silverstripe

a2dissite default
a2ensite silverstripe

service apache2 stop
service apache2 start
