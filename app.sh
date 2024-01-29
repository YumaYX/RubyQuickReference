#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

echo '### Executed with:'
echo '```'
echo $(ruby -v)
echo '```'
echo


echo '## Contents'
echo
echo '<ul>'
ls -1 *.rb | while read line
do
  echo "<li><a href=\"${line%.*}.html\">$(basename ${line})</a></li>"
done
echo '</ul>'
