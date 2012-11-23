#!/usr/bin/perl

use Term::ANSIColor;

#Errors
if ( !@ARGV[0] ) {
	print color 'red';
	print "error";
	print color 'reset';
	print " - no controller name\n";
	exit 1;
}

if ( !@ARGV[1] ) {
	print color 'yellow';
	print "warning";
	print color 'reset';
	print
" - controller should have one function\n          adding index function by default\n";
	@ARGV[1] = "index";
}

#Get the controller name
$controller = ucfirst( @ARGV[0] );

#Create the file
open CONTROLLER, ">" . $controller . ".php" or die $!;

#Start the controller class
print CONTROLLER "<?php \n\nclass " . $controller . " {";

#Define the functions array
shift(@ARGV);
@functions_array = @ARGV;

#Create the controllers functions
foreach (@functions_array) {

	my @subpage = split( '--', $_ );

	#If a view is defined
	if ( @subpage[1] ) {

		#If the first part is not defined it is an index page
		if ( !@subpage[0] ) {
			@subpage[0] = 'index';
		}

		print CONTROLLER "\n\n	function "
		  . @subpage[0]
		  . "() {\n		MLoad::view('"
		  . @subpage[1]
		  . ".php');\n	}";

	}
	     #If a view is not defined
	else {
		print CONTROLLER "\n\n	function " . $_ . "() {\n\n	}";
	}

}

#End the controller class
print CONTROLLER "\n\n}\n";

#Output success
print color 'green';
print "created";
print color 'reset';
print " controller " . $controller . ".php\n";
