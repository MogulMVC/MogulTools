#!/usr/bin/perl

use Term::ANSIColor;

#Errors
if ( !@ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no model name\n";
	exit 1;
}

if ( !@ARGV[1] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - please specify the table to use as a second parameter\n";
	exit 1;
}

#Get the model name
$model = ucfirst( @ARGV[0] ) . 'Model';

#Create the file
open MODEL, ">" . $model . ".php" or die $!;

#Start the model class
print MODEL "<?php \n\nclass " . $model . " extends MActiveRecord {";

print MODEL "\n\n static \$table = '" . @ARGV[1] . "';";

#Define the functions array
shift(@ARGV);
shift(@ARGV);
@functions_array = @ARGV;

#Create the models functions
if (functions_array) {
	foreach (@functions_array) {
		print MODEL "\n\n	public static function " . $_ . "() {\n\n	}";
	}
}

#End the model class
print MODEL "\n\n}\n";

#Output success
print color 'green';
print "created";
print color 'reset';
print " model " . $model . ".php\n";
print "Be sure to autoload core/db/MActiveRecord\n";
