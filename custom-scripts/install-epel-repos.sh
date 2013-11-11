#!/bin/sh 

cd /tmp/

epel_installed=$(rpm --query --all | grep epel-release-5-4);
remi_installed=$(rpm --query --all | grep remi-release-5);

if [[ (( "${remi_installed}" == "" )) || (( "${epel_installed}" == "" )) ]] ; then
    wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm &&
    wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm &&
    rpm -Uvh remi-release-5.rpm epel-release-5-4.noarch.rpm &&
    echo Epel repos installed || (echo error; exit 1);
fi;

exit 0;