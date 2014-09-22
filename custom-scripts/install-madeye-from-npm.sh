#!/bin/sh

if [[ `which madeye` ]]; then echo MadEye already installed!; return 0; fi;

npm install -g madeye &&
echo "MadEye Installed" || (echo MadEye error; exit 1;);

exit 0;
