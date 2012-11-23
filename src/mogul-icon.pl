#!/usr/bin/perl

use Term::ANSIColor;

if ( !@ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no file specified\n";
	exit 1;
}

system( 'convert ' . @ARGV[0] . ' -resize 64x64 icon.png' );
system( 'convert ' . @ARGV[0] . ' -resize 16x16 favicon.ico' );
