#!/bin/sh
if [[ `which git` ]]; then echo git already installed; exit 0; fi;

cd /tmp;

base_url=https://git-core.googlecode.com/files/git-1.8.4.tar.gz
man_url=https://git-core.googlecode.com/files/git-manpages-1.8.4.tar.gz
base_file_name=`basename $base_url`;
man_file_name=`basename $man_url`;

wget -c $base_url &&
wget -c $man_url &&
echo Files fetched  || (echo error; exit 1);

base_dir=`tar -tf ${base_file_name} | head -n 1 --`;
tar -xvf $base_file_name &&
echo Files extracted || (echo error; exit 1);

echo Installing git
cd $base_dir;
./configure &&
make -j3 &&
make install &&
echo "export PATH=/usr/local/bin/:\$PATH"  > /etc/profile.d/git.sh &&
echo Git installed successfully || (echo error; exit 1);

cd -;

echo Installing git man pages
tar -xf ${man_file_name} -C /usr/share/man;

echo Done;