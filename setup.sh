#!/bin/bash

if [ $UID != 0 ]; then
    echo "This script must be run as root"
    exit -1;
fi

CDIR=$(cd $(dirname $0) && pwd)
cd $CDIR
git submodule update --init

source $CDIR/runner/env.sh

mkdir -p $STF_PREFIX
git clone https://github.com/stf-storage/stf.git $STF_PREFIX/stf

curl -kL http://install.perlbrew.pl | bash
source $PERLBREW_ROOT/etc/bashrc


perlbrew install perl-5.16.2
perlbrew switch perl-5.16.2
perlbrew install-cpanm

cd $STF_HOME
cpanm --installdeps .


cd $CDIR
sh ./q4m/setup.sh

if ! [ -e $STF_PREFIX/config.sh ]; then
    cp $CDIR/runner/config.template.sh $STF_PREFIX/config.sh
fi

useradd stf
mkdir -p /var/stf/storage
chown stf:stf /var/stf/storage
mkdir -p /home/stf/var/run
chown stf:stf /home/stf/var/run
chown stf:stf -R $CDIR
