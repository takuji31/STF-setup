#!/bin/bash

source /usr/local/stf/env/stf.bashrc
source /usr/local/stf/env/dispatcher.bashrc
cd $STF_HOME
exec start_server\
    --port=$STF_DISPATCHER_PORT\
    --pid-file=$STF_HOME/var/run/stf-dispatcher.pid\
    --status-file=$STF_HOME/var/run/str-dispatcher.status\
    --interval 2\
    -- plackup -s Starlet --workers 10 -a $STF_HOME/etc/dispatcher.psgi
