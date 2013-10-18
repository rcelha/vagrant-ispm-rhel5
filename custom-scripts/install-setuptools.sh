#!/bin/sh 
if [[ `which easy_install-2.7` ]]; then echo easy_install already installed; exit 0; fi;

echo Installing setuptools;
cd /tmp;
rm -f setuptools-1.1.4.tar.gz;
rm -f setuptools-1.1.4;

wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.4.tar.gz &&
tar -xvf setuptools-1.1.4.tar.gz &&
cd setuptools-1.1.4 &&
python2.7 setup.py install &&
echo Setuptools installed || (echo error; exit 1);

cd ~;