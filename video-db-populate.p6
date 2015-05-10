#!/usr/bin/env perl6

use v6;
use DBIish;
use Template::Mojo;

my $dbh = DBIish.connect('SQLite', database => 'video.db');

$dbh.do('DROP TABLE IF EXISTS video');

my $sql =  q:to"END";
CREATE TABLE video(
    id integer primary key not null,
    title text not null,
    uri text not null
)
END

$dbh.do($sql);

my $st = $dbh.prepare('INSERT INTO video(title, uri) VALUES(?, ?)');

$st.execute("Larry Wall - Keynote, APW2014 2014-10-10 ", "https://www.youtube.com/watch?v=enlqVqit62Y");
$st.execute("Carl Mäsak - Regexes in Perl 6 - Zero to Perl 6 Training", "https://www.youtube.com/watch?v=oo-gA9Z9SaA");
