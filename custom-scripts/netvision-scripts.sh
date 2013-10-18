#!/bin/sh

echo "
cd /home/vagrant &&
if [[ ! -d xenv ]]; then
	virtualenv xenv;
fi;
source /home/vagrant/xenv/bin/activate &&

mkdir -p repos && 
cd repos && 
git clone git@github.com:ISPM/netvision.git &&
cd netvision && 
python setup.py develop &&
cd - &&
echo \"Netvision is ready\" || (echo erro; exit 1);
" > /usr/local/bin/netvision-script.sh ;
chmod +x /usr/local/bin/netvision-script.sh;

if [[ ! -d /home/vagrant/repos/netvision ]]; then 
	echo ************************************************************************************************
	echo *																								*
	echo * Setup you github keys \(github-key.sh\) and run command netvision-script.sh as vagrant user	*
	echo *																								*
	echo ************************************************************************************************
fi;