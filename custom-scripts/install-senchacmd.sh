#!/bin/sh 
if [[ `which sencha` ]]; then echo sencha cmd already installed; exit 0; fi;

echo Installing SenchaCMD;
_cd=`pwd`;
sencha_url=http://cdn.sencha.com/cmd/4.0.1.45/SenchaCmd-4.0.1.45-linux-x64.run.zip;
sencha_file=`basename $sencha_url`;


cd /tmp;

rm -rf ${sencha_file}
wget -c $sencha_url &&
unzip -o ${sencha_file} &&
chmod +x ./SenchaCmd-4.0.1.45-linux-x64.run &&
./SenchaCmd-4.0.1.45-linux-x64.run --mode unattended &&
echo "SenchaCMD Installed" || (echo error; exit 1);

cd -;

cd $_cd;