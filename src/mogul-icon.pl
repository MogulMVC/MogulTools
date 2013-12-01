#!/usr/bin/perl

use Term::ANSIColor;

#Check if the icon name has been specified
if ( !$ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no file specified\n";
	exit 1;
}

print color 'green';

#Create Apple icons
print "Creating Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 57x57 apple-touch-icon.png' );

print "Creating precomposed Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 57x57 apple-touch-icon-precomposed.png' );

print "Creating 57x57 precomposed Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 57x57 apple-touch-icon-57x57-precomposed.png' );

print "Creating 72x72 precomposed Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 72x72 apple-touch-icon-72x72-precomposed.png' );

print "Creating 114x114 precomposed Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 114x114 apple-touch-icon-114x114-precomposed.png' );

print "Creating 144x144 precomposed Apple icon\n";
system( 'convert ' . $ARGV[0] . ' -resize 144x144 apple-touch-icon-144x144-precomposed.png' );

#Create favicon
print "Creating multi resolution favicon\n";
system( 'convert ' . $ARGV[0] . ' \
  \( -clone 0 -resize 16x16 \) \
  \( -clone 0 -resize 32x32 \) \
  \( -clone 0 -resize 48x48 \) \
  \( -clone 0 -resize 64x64 \) \
  -delete 0 favicon.ico');

print color 'reset';