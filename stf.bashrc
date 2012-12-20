export STF_HOME=/usr/local/stf
export STF_RUN=$STF_HOME/var/run
export PERLBREW_ROOT=$STF_HOME/perlbrew
export PERLBREW_HOME=$STF_HOME/perlbrew/home

# SHELL variable hack
export SHELL=/bin/bash
if [ -e $STF_HOME/perlbrew/etc/bashrc ]; then
    source $STF_HOME/perlbrew/etc/bashrc
fi

export PATH="$STF_HOME/extlib/bin:$PATH"
export PERL5LIB="$STF_HOME/extlib/lib/perl5:$STF_HOME/lib:$PERL5LIB"
