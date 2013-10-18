#!/bin/sh 
if [[ `which python2.7` ]]; then echo python already installed; exit 0; fi;

echo Installing python;
_cd=`pwd`;
python_url=http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz;
python_file=`basename $python_url`;


cd /tmp;

wget -c $python_url &&
python_dir=`tar -tf ${python_file} | head -n 1 --` &&
tar -xvf $python_file &&
cd $python_dir &&
./configure -q --enable-shared &&
make -j3 &&
make install &&
echo "export PATH=/usr/local/bin/:\$PATH"  > /etc/profile.d/python.sh &&
echo "export LD_LIBRARY_PATH=/usr/local/lib/:\$LD_LIBRARY_PATH"  >> /etc/profile.d/python.sh &&
echo "Python Installed" || (echo error; exit 1);

cd -;

cd $_cd;