#!/usr/bin/env perl6

use v6;
use HTTP::Easy::PSGI;
use DBIish;
use Template::Mojo;

my $http = HTTP::Easy::PSGI.new(:port(8080));

my $dbh = DBIish.connect('SQLite', database => 'video.db');

my $st = $dbh.prepare('SELECT title,uri FROM video');
$st.execute;

my @datas =  $st.fetchall-AoH;

my $tmpl = slurp 'video-db.tm';
my $t = Template::Mojo.new($tmpl);
my $html =  $t.render(@datas);

my $app = sub (%env)
  {
    return [ 200, [ 'Content-Type' => 'text/html;charset=UTF-8' ], [ $html ] ];
  }

$http.handle($app);
