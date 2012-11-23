#!/usr/bin/perl

use Term::ANSIColor;

#Remove all .gitempty files
system('find . -name ".gitempty" -exec rm -rf {} \;');

#Add .gitempty files to empty folders
system('find . -type d -empty -exec touch {}/.gitempty \;');

print color 'green';
print "complete\n";
print color 'reset';
