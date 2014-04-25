#!/bin/sh

if [[ `rvm list rubies | grep 1.9.3` ]]; then  exit 0; fi;


rvm install ruby-1.9.3 &&
su -c "echo rvm 1.9.3 >  /home/vagrant/.bash_profile" - vagrant || (echo RUBY INSTALL ERROR; exit 1;);

exit 0;