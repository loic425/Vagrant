#!/bin/bash

cd /var/www/sites

composer create-project --no-progress -s beta -n sylius/sylius-standard ./sylius 

cd sylius

sed -i "s/database_password: null/database_password: vagrant/g" app/config/parameters.yml

php bin/console sylius:install --no-interaction
php bin/console sylius:fixtures:load
yarn install
yarn run gulp
