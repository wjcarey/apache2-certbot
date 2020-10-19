#! /bin/bash

if [ -z "$1" ]
    then
        echo "enter the webroot of your website ..."
        read INSTALL_PATH
        echo "enter the domain name of your website ..."
        read DOMAIN_NAME
    else
    INSTALL_PATH=${1}
    DOMAIN_NAME=${2}
fi

INSTALL_PATH=$(realpath -s --canonicalize-missing $INSTALL_PATH)

sudo apt-get install certbot python3-certbot-apache -y
certbot -a webroot -i apache -w ${INSTALL_PATH} -d ${INSTALL_DOMAIN} --agree-tos --no-eff-email --redirect --register-unsafely-without-email
certbot renew --dry-run

#SELF DELETE AND EXIT
rm -- "$0"
exit