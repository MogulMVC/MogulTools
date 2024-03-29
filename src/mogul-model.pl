#!/usr/bin/perl

use Term::ANSIColor;

#Check if the model name has been specified
if ( !$ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no model name\n";
	exit 1;
}

if ( !$ARGV[1] ) {
	print color 'yellow';
	print "warning";
	print color 'reset';
	print " - model should have one function\n adding read, write, update, and delete functions by default\n";
	$ARGV[1] = "create";
	$ARGV[2] = "read";
	$ARGV[3] = "update";
	$ARGV[4] = "delete";
}

#Get the model name
$model = ucfirst( $ARGV[0] ) . 'Model';

#Create the file
open MODEL, ">" . $model . ".php" or die $!;

#Start the model class
print MODEL "<?php \n\nMLoad::php_framework('core/db/MPDO'); \n\nclass " . $model . " {";

#Define the functions array
shift(@ARGV);
@functions_array = @ARGV;

#Create the models functions
foreach (@functions_array) {
	print MODEL "\n\n	public static function " . $_ . "() {\n\n	}";
}

#End the model class
print MODEL "\n\n}\n";

#Output success
print color 'green';
print "created";
print color 'reset';
print " model " . $model . ".php\n";
