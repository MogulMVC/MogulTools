#!/usr/bin/perl

use Term::ANSIColor;

#Check if the view name has been specified
if ( !$ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no view name\n";
	exit 1;
}

#Get the view name
$view = lc( $ARGV[0] );

#Create the file
open VIEW, ">" . $view . ".php" or die $!;

#Start the view class
print VIEW '<div id="MToolBarPlaceholder"></div>' . "\n";
print VIEW '<nav id="MToolBar">' . "\n\n";
print VIEW '</nav>' . "\n\n";

print VIEW '<h1>' . $view . '</h1>';

#Output success
print color 'green';
print "created";
print color 'reset';
print " controller " . $view . ".php\n";
