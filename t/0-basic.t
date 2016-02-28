#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 3;

use Config;

ok($Config{startperl}, 'initial state');

use Mock::Config startperl => '';
diag( "Testing Mock::Config, Perl $], ".
      (exists &Config::KEYS ? 'XS' : '')."Config $Config::VERSION, $^X" );

ok(!$Config{startperl}, 'mocked to empty');

no Mock::Config;

ok($Config{startperl}, 'reset');
