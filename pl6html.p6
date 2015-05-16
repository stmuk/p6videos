#!/usr/bin/env perl6

use v6;

my $lang = 'perl6';
my $in = 'video-db-populate.p6';
my $out = $in.subst("p6","html");

my $version = q:x/ex --version/;
$version.=split("\n")[0];
die "didn't find a recent vim/ex"  unless $version ~~ /' Vi IMproved 7.4 '/;

my $exit = shell "ex -c 'set bg=light|set ft=$lang|TOhtml|wq! $out|quit' $in 2>&1 > /dev/null";

die "fail" unless $exit==0;
