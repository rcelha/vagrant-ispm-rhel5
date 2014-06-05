#!/bin/sh

# ssl certificates
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt;

# add postgres path
# echo "PATH=$PATH:/usr/pgsql-9.2/bin/" > /etc/profile.d/postgres92.sh
# chmod +x /etc/profile.d/postgres92.sh