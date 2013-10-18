#!/bin/sh 
if [[ `which pip-2.7` ]]; then echo pip already installed; exit 0; fi;

echo Installing setuptools;
cd /tmp;
rm -f pip-1.4.1.tar.gz;
rm -f pip-1.4.1;

wget --no-check-certificate https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz &&
tar -xvf pip-1.4.1.tar.gz &&
cd pip-1.4.1 &&
python2.7 setup.py install &&
echo pip installed || (echo error; exit 1);

cd ~;