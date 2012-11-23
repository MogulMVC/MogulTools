#!/usr/bin/perl

use Term::ANSIColor;

system('tar xvzf /opt/mogul/Mogul.tar.gz');

print color 'green';
print "complete\n";
print color 'reset';
