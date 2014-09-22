#!/bin/sh 

install_nodejs () {
    if [[ `which node` ]]; then echo NodeJs already installed!; return 0; fi;

    echo "################"
    echo Installing nodejs;
    echo "################"

    node_url=http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz;
    node_file=`basename $node_url`;

    cd /tmp;

    wget --no-check-certificate -c $node_url &&
    node_dir=`tar -tf ${node_file} | head -n 1 --` &&
    tar -xvf $node_file &&
    cd $node_dir &&
    ./configure &&
    make -j3 &&
    make install &&

    echo "NodeJs 0.10.32 Installed" || (echo error; return 1);
    cd ~;
}

install_nodejs;
