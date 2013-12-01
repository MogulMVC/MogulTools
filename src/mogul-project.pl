#!/usr/bin/perl

use Term::ANSIColor;

#Check if the project name has been specified
if ( $ARGV[0] ) {
	mkdir $ARGV[0];
	system( 'tar xvzf /opt/mogul/Mogul.tar.gz -C ' . $ARGV[0] );
}
else {
	system('tar xvzf /opt/mogul/Mogul.tar.gz');
}

print color 'green';
print "complete\n";
print color 'reset';
