# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
	config.vm.box = "vagrant-rhel55-x64"
	config.vm.box_url = "http://192.168.8.245:8904/vagrant-rhel55-x64.virtualbox.box"

	config.vm.customize [
        "modifyvm", :id, 
        "--cpus", "2",
        "--memory", "512"]

	#networking
    # config.vm.network :hostonly, "192.168.56.100"
	config.vm.network :bridged

	# config.vm.forward_port guest, host
	config.vm.forward_port 8000, 8000
	config.vm.forward_port 80, 8081

	###############
	# Provisioner #
	###############

    # Add the ISPMRJ and EPEL repos
    config.vm.provision :shell, :path => "custom-scripts/install-epel-repos.sh"
    config.vm.provision :shell do |s|
        s.path = "custom-scripts/yum-repo.sh"
        s.args = "ispmrj_repos http://192.168.8.245:8904/Server/"
    end

    # dependencies from yum repos
    config.vm.provision :shell do |s|
        s.path = "custom-scripts/yum-install.sh"
        s.args = "bzip2-devel-1.0.3-4.el5_2.x86_64 curl-devel-7.15.5-9.el5.x86_64 e2fsprogs-devel-1.39-23.el5.x86_64 libgcc-4.1.2-48.el5.x86_64 libgcc-4.1.2-48.el5.x86_64 gcc-4.1.2-48.el5.x86_64 glibc-devel-2.5-49.x86_64 glibc-headers-2.5-49.x86_64 kernel-headers-2.6.18-194.el5.x86_64 keyutils-libs-devel-1.2-1.el5.x86_64 krb5-devel-1.6.1-36.el5_4.1.x86_64 libgomp-4.4.0-6.el5.x86_64 libidn-devel-0.6.5-1.1.x86_64 libselinux-devel-1.33.4-5.5.el5.x86_64 libsepol-devel-1.15.2-3.el5.x86_64 openssl-devel-0.9.8e-12.el5_4.6.x86_64 xorg-x11-server-Xvfb-1.1.1-48.76.el5.x86_64 zlib-devel-1.2.3-3.x86_64 freetds.x86_64 freetds-devel.x86_64 libxml2-devel.x86_64 libxslt-devel.x86_64 libevent-devel.x86_64 sqlite-devel.x86_64 httpd.x86_64 screen.x86_64 samba.x86_64"
    end

    # Some dependencies from source

    # 	git
    config.vm.provision :shell, :path => "custom-scripts/install-git.sh"
    # 	python 275
    config.vm.provision :shell, :path => "custom-scripts/install-python.sh"
    config.vm.provision :shell, :path => "custom-scripts/install-setuptools.sh"
    # config.vm.provision :shell, :path => "custom-scripts/install-pip.sh"
    config.vm.provision :shell, :path => "custom-scripts/install-venv.sh"

    # Netvision scripts
    config.vm.provision :shell, :path => "custom-scripts/netvision-scripts.sh"

    # Some fixes
    config.vm.provision :shell, :path => "custom-scripts/fix.sh"

    # samba
    config.vm.provision :shell, :path => "vagrant-sh-provisioner-scripts/samba.sh"
end