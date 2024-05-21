#!/usr/bin/perl
use strict;
use warnings;

# Check if filename and word are provided
if (@ARGV != 2) {
    print "Usage: perl script.pl filename word\n";
    exit 1;
}

my ($filename, $word) = @ARGV;

# Read the file
open my $fh, '<', $filename or die "Could not open '$filename' $!\n";
my $content = do { local $/; <$fh> };

# Convert to lowercase and remove non-alphabetic characters
$content = lc $content;
$content =~ s/[^a-z]//g;

# Count occurrences
my $count = () = reverse($content) =~ /(?=reverse($word))/g;

# Output
print "Matches: $count\n";