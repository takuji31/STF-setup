export STF_HOME=/usr/local/stf
export STF_USER=stf

#Debug envrionment
#export STF_DEBUG=1
#export STF_TIMER=1

## MySQL
export STF_MYSQL_DSN=dbi:mysql:stf:127.0.0.1:13306
export STF_MYSQL_USERNAME=root
export STF_MYSQL_PASSWORD=''
export STF_QUEUE_DSN=dbi:mysql:stf_queue:127.0.0.1:13306
export STF_QUEUE_USERNAME=root
export STF_QUEUE_PASSWORD=''


export PATH="$STF_HOME/extlib/bin:$PATH"
export PERL5LIB="$STF_HOME/extlib/lib/perl5:$STF_HOME/lib:$PERL5LIB"
