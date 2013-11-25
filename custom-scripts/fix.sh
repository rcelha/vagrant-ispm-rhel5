#!/bin/sh

# ssl certificates
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt;

# fixing permissions
scripts=`ls /vagrant/vagrant-sh-provisioner-scripts/bin/`
for i in $scripts; do
	tr -d '\015' </vagrant/vagrant-sh-provisioner-scripts/bin/$i > /usr/bin/$i;
	chmod +x /usr/bin/$i;
done;

# add postgres path
echo "PATH=$PATH:/usr/pgsql-9.2/bin/" > /etc/profile.d/postgres92.sh
chmod +x /etc/profile.d/postgres92.sh