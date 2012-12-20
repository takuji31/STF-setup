#!/bin/bash

source /usr/local/stf/stf.bashrc
source /usr/local/stf/etc/common.bashrc
source /usr/local/stf/etc/dispatcher.bashrc

cd $STF_HOME
exec start_server\
    --port=$STF_DISPATCHER_PORT\
    --pid-file=$STF_RUN/stf-dispatcher.pid\
    --status-file=$STF_RUN/str-dispatcher.status\
    --interval 2\
    -- plackup -s Starlet --workers 10 -a $STF_HOME/etc/dispatcher.psgi
