#!/bin/sh

source /tmp/provisioner-base.sh;
print_debug copy-files.sh

copy_files "vagrant-sh-provisioner-scripts/bin/*" "/usr/local/bin/" 1
copy_files "bin/*" "/usr/local/bin/" 1