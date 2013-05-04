#!/usr/bin/perl

use Term::ANSIColor;

#Check if the controller name has been specified
if ( !$ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no controller name\n";
	exit 1;
}

#Warn if no functions were given
if ( !$ARGV[1] ) {
	print color 'yellow';
	print "warning";
	print color 'reset';
	print " - controller should have one function\n          adding index function by default\n";
	$ARGV[1] = "index";
}

#Get the controller name
$controller = ucfirst( $ARGV[0] );

#Create the file
open CONTROLLER, ">" . $controller . ".php" or die $!;

#Start the controller class
print CONTROLLER "<?php";
print CONTROLLER "\n\n";
print CONTROLLER "class " . $controller . " {";

#Define the functions array
shift(@ARGV);
@functions_array = @ARGV;

#Create the controllers functions
foreach (@functions_array) {

	my @subpage = split( '--', $_ );

	#If a view is defined
	if ( $subpage[1] ) {

		#If the first part is not defined it is an index page
		if ( !$subpage[0] ) {
			$subpage[0] = 'index';
		}

		print CONTROLLER "\n\n";
		print CONTROLLER "	function " . $subpage[0] . "() {";
		print CONTROLLER "\n";
		print CONTROLLER "		MLoad::view('" . $subpage[1] . ".php');\n	}";

	}

	#If a view is not defined
	else {
		print CONTROLLER "\n\n";
		print CONTROLLER "	function " . $_ . "() {";
		print CONTROLLER "\n\n";
		print CONTROLLER "	}";
	}

}

#End the controller class
print CONTROLLER "\n\n";
print CONTROLLER "}\n";

#Output success
print color 'green';
print "created";
print color 'reset';
print " controller " . $controller . ".php\n";
