#!/bin/sh

PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'install +LWP::UserAgent'
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'install +Date::Calc::XS'

#or

#PERL_MM_USE_DEFAULT=1 perl -MCPAN -Mlocal::lib=~/perl5 -e 'install +LWP::UserAgent'
#PERL_MM_USE_DEFAULT=1 perl -MCPAN -Mlocal::lib=~/perl5 -e 'install +Date::Calc::XS'
#insert export PERL5LIB='/home/yourid/perl5/lib/perl5' at ~/.bashrc
