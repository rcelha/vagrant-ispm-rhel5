#!/bin/sh

if [[ ! `which ruby` ]]; then exit 0; fi;

	rvm install ruby-1.9.3 &&
	rvm use ruby-1.9.3-p0 &&
	su -c "rvm use ruby-1.9.3-p0" - vagrant || (echo RUBY INSTALL ERROR; exit 1;);

	exit 0;