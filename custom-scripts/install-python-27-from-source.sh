#!/bin/sh 

install_python () {
    if [[ `which python2.7` ]]; then echo python already installed; return 0; fi;

    echo "################"
    echo Installing python;
    echo "################"

    python_url=http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz;
    python_file=`basename $python_url`;


    cd /tmp;

    wget --no-check-certificate -c $python_url &&
    python_dir=`tar -tf ${python_file} | head -n 1 --` &&
    tar -xvf $python_file &&
    cd $python_dir &&
    ./configure -q --enable-shared &&
    make -j3 &&
    make install &&

    echo "export PATH=/usr/local/bin/:\$PATH"  > /etc/profile.d/python.sh &&
    echo "export LD_LIBRARY_PATH=/usr/local/lib/:\$LD_LIBRARY_PATH"  >> /etc/profile.d/python.sh &&

    source /etc/profile.d/python.sh &&

    echo "Python Installed" || (echo error; return 1);

    cd ~;
}


install_venv () {
    if [[ `which virtualenv` ]]; then echo virtualenv already installed; return 0; fi;

    echo "################"
    echo Installing Venv;
    echo "################"

    cd /tmp;

    rm -fr virtualenv-1.10.1.tar.gz virtualenv-1.10.1;

    curl -O https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.10.1.tar.gz &&
    tar xvfz virtualenv-1.10.1.tar.gz &&
    cd virtualenv-1.10.1 &&
    python setup.py install &&
    echo Virtualenv installed || (echo error; return 1);

    cd ~;
}

install_setuptools () {
    if [[ `which easy_install-2.7` ]]; then echo easy_install already installed; return 0; fi;


    echo "################"
    echo Installing setuptools;
    echo "################"

    echo Installing setuptools;
    cd /tmp;
    rm -f setuptools-1.1.4.tar.gz;
    rm -f setuptools-1.1.4;

    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.4.tar.gz &&
    tar -xvf setuptools-1.1.4.tar.gz &&
    cd setuptools-1.1.4 &&
    python2.7 setup.py install &&
    echo Setuptools installed || (echo error; return 1);

    cd ~;
}

install_pip () {
    if [[ `which pip-2.7` ]]; then echo pip already installed; return 0; fi;

    echo "#####################"
    echo Installing setuptools;
    echo "#####################"

    cd /tmp;
    rm -f pip-1.4.1.tar.gz;
    rm -f pip-1.4.1;

    wget --no-check-certificate https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz &&
    tar -xvf pip-1.4.1.tar.gz &&
    cd pip-1.4.1 &&
    python2.7 setup.py install &&
    echo pip installed || (echo error; return 1);

    cd ~;
}

install_python && install_venv && install_setuptools && install_pip;