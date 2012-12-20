#!/bin/bash

source /usr/local/stf/stf.bashrc
source /usr/local/stf/etc/common.bashrc
source /usr/local/stf/etc/storage.bashrc

cd $STF_HOME
exec start_server\
    --port=$STF_STORAGE_PORT\
    --pid-file=$STF_HOME/var/run/stf-storage.pid\
    --status-file=$STF_HOME/var/run/str-storage.status\
    --interval 2\
    -- plackup -s Starlet --workers 10 -a $STF_HOME/etc/storage.psgi
