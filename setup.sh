#!/bin/sh
set -e

if [ $UID != 0 ]; then
    echo "This script must be run as root"
    exit -1;
fi

STF_PREFIX=/usr/local
STF_HOME=$STF_PREFIX/stf
STF_VAR=$STF_PREFIX/var
STF_STORAGE=$STF_VAR/storage
STF_RUN=$STF_VAR/run

CDIR=$(cd $(dirname $0) && pwd)
cd $CDIR


mkdir -p $STF_PREFIX
git clone https://github.com/stf-storage/stf.git $STF_HOME


cd $STF_HOME
curl -L http://cpanmin.us | perl - --no-man-pages --verbose --no-interactive -L extlib --installdeps .


useradd stf
mkdir -p $STF_STORAGE
chown stf:stf $STF_STORAGE
mkdir -p $STF_RUN
chown stf:stf $STF_RUN
