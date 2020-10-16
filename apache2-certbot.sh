#! /bin/bash

if [ -z "$1" ]
    then
        echo "enter the webroot of your website ..."
        read WEB_ROOT
        echo "enter the domain name of your website ..."
        read INSTALL_DOMAIN
    else
    WEB_ROOT=${1}
    INSTALL_DOMAIN=${2}
fi

sudo apt-get install certbot python3-certbot-apache -y
certbot -a webroot -i apache -w ${WEB_ROOT} -d ${INSTALL_DOMAIN} --agree-tos --no-eff-email --redirect --register-unsafely-without-email
certbot renew --dry-run

#SELF DELETE AND EXIT
rm -- "$0"
exit