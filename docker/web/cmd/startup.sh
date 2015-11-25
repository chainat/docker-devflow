#!/bin/bash
set -e

SERVER_PASSWORD=${SERVER_PASSWORD:-"changeme000"}
SERVER_KEY=${SERVER_KEY:-""}

PHP_ERROR_REPORTING=${PHP_ERROR_REPORTING:-"E_ALL & ~E_DEPRECATED & ~E_NOTICE"}
sed -ri "s/^error_reporting\s*=.*$//g" /etc/php5/apache2/php.ini
sed -ri "s/^error_reporting\s*=.*$//g" /etc/php5/cli/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php5/apache2/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php5/cli/php.ini

echo "root:$SERVER_PASSWORD" | chpasswd
echo "ubuntu:$SERVER_PASSWORD" | chpasswd
echo "$SERVER_KEY" > /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
chmod 700 /home/ubuntu/.ssh/authorized_keys

exec supervisord -n