#!/usr/bin/perl
# counts the number of sregions with at least 6 aminoacids.
# use perl count_E.pl infile 
# prints the name and results for all proteins 



use strict;
my $secuencia;
my $linea_asterisco;
my $numero_asterisco;
my $largo;
my $razon;
my $corte=2;

use Getopt::Long;
my $help;
GetOptions (
    'corte:i' => \$corte, 		
);            






print "gen\tlargo\tregiones\tlargo/regiones\n";

while (<>) {
	$largo=0;
	if ($_=~/^\>/) {
		$secuencia=<>;
		$linea_asterisco=<>;
		$numero_asterisco=()=$linea_asterisco=~/E{6,}/g;
		$largo=length($secuencia);
		chomp($_);
		$_=~s/^\>//;
		if ($numero_asterisco>0) {
			$razon=$largo/$numero_asterisco;
		} else {
		$razon="NA";
		}
		print "$_\t$largo\t$numero_asterisco\t$razon\n" if ($numero_asterisco >= $corte );
	}
}

#Creado por Vito Adrian Cantu