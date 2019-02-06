use FindBin;
use local::lib "$FindBin::Bin/local";
use Mojo::Base -strict;

# my $input = "hello\'; print \'yes";
my $input = "hel";
my $pred = "'hello' eq '$input'";
say $pred;

my $result = eval($pred);
say $result;
