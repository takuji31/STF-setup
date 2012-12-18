#!/bin/bash

#Debug envrionment
#export STF_DEBUG=1
#export STF_TIMER=1

## Nginx
export STF_NGINX_STYLE_REPROXY=1
export STF_NGINX_STYLE_REPROXY_ACCEL_REDIRECT_URL=/reproxy

## MySQL
export STF_MYSQL_DSN=dbi:mysql:stf:127.0.0.1:13306
export STF_MYSQL_USERNAME=root
export STF_MYSQL_PASSWORD=''
export STF_QUEUE_DSN=dbi:mysql:stf_queue:127.0.0.1:13306
export STF_QUEUE_USERNAME=root
export STF_QUEUE_PASSWORD=''

export STF_DISPATCHER_PORT=8887

# Storage path (writable and exists)
export STF_STORAGE_ROOT=/var/stf/storage
export STF_STORAGE_PORT=8888

