% my @rows = @_;

<ul>
% for @rows -> $p {
  <li><a href="<%= $p<uri> %>"><%= $p<title> %></a></li>
% }
</ul>
