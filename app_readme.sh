#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

echo '## Contents'
echo
ls -1 *.rb | while read line
do
  echo "- [$(basename ${line})](https://yumayx.github.io/RubyQuickReference/#$(basename ${line/\./}))"
done
