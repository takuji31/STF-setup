#!/bin/sh
set -e

if [ $UID != 0 ]; then
    echo "This script must be run as root"
    exit -1;
fi

STF_USER=$1
if [ -z "$STF_USER" ]; then
    STF_USER=stf
fi

CDIR=$(cd $(dirname $0) && pwd)
cd $CDIR

source $CDIR/stf.bashrc
source $CDIR/etc/storage.bashrc


mkdir -p /usr/local
git clone https://github.com/stf-storage/stf.git $STF_HOME


cd $STF_HOME

curl -kL http://install.perlbrew.pl | bash
source $PERLBREW_ROOT/etc/bashrc

perlbrew install perl-5.16.2
perlbrew switch perl-5.16.2

rm -rf $PERLBREW_ROOT/dists/*
rm -rf $PERLBREW_ROOT/build/*

curl -L http://cpanmin.us | perl - --no-man-pages --verbose --no-interactive -L extlib --installdeps .


if [ -z `cat /etc/passwd | cut -f1 -d: | grep -e "^$STF_USER$"` ]; then
    echo "create user"
    useradd $STF_USER
fi
mkdir -p $STF_STORAGE_ROOT
mkdir -p $STF_RUN
cp -r $CDIR/etc/* $STF_HOME/etc/
cp -r $CDIR/bin/* $STF_HOME/bin/
cp $CDIR/stf.bashrc $STF_HOME/
chown $STF_USER -R $STF_HOME/var/
