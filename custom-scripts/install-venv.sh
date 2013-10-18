#!/bin/sh 
if [[ `which virtualenv` ]]; then echo virtualenv already installed; exit 0; fi;

cd /tmp;

rm -fr virtualenv-1.10.1.tar.gz virtualenv-1.10.1;

curl -O https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.10.1.tar.gz &&
tar xvfz virtualenv-1.10.1.tar.gz &&
cd virtualenv-1.10.1 &&
python setup.py install &&
echo Virtualenv installed || (echo error; exit 1);

cd ~;