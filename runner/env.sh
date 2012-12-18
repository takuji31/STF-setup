#!/bin/bash
export STF_PREFIX=/usr/local/stf
export STF_HOST_ID=101
export STF_HOME=$STF_PREFIX/stf
export STF_USER=stf
export STF_CONF=$STF_PREFIX/config.sh

export PERLBREW_ROOT=$STF_PREFIX/perlbrew
export PERLBREW_HOME=$STF_PREFIX/.perlbrew

[ -e $STF_CONF ] && source $STF_CONF

[ -e $PERLBREW_ROOT/etc/bashrc ] && source $PERLBREW_ROOT/etc/bashrc

export PATH="$STF_HOME/extlib/bin:$PATH"
export PERLOPT="perl -I $STF_HOME/extlib/lib/perl5 -I $STF_HOME/lib"

