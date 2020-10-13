#! /bin/bash

if [ -z "$1" ]
    then
        echo "enter the webroot of your website ..."
        read WEB_ROOT
        echo "enter the domain name of your website ..."
        read INSTALL_DOMAIN
        echo "enter a email address for renewal notices ..."
        read NOTICE_EMAIL
        sudo apt-get install certbot python3-certbot-apache -y
        certbot -a webroot -i apache -w ${WEB_ROOT} -d ${INSTALL_DOMAIN} --agree-tos -m ${NOTICE_EMAIL} --no-eff-email --redirect
        certbot renew --dry-run
    else
    sudo apt-get install certbot python3-certbot-apache -y
    certbot -a webroot -i apache -w ${1} -d ${2} --agree-tos -m admin@admin.com --no-eff-email --redirect
    certbot renew --dry-run
fi

#SELF DELETE AND EXIT
rm -- "$0"
exit