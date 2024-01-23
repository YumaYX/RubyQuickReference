#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

echo '## Contents'
echo
echo '<ul>'
ls -1 *.rb | while read line
do
  echo "<li><a href=\"#$(basename ${line/\./})\">$(basename ${line})</a></li>"
done
echo '</ul>'
echo

ls -1 *.rb | while read line
do
  echo '---'
  echo
  echo "# $(basename ${line})"
  echo

  if [ -f "${line%.*}.md" ]; then
    cat ${line%.*}.md
    echo
  fi

  cat <<OUTPUT
\`\`\`ruby
$(irb --prompt simple ${line} \
    | sed -e '$d' \
    | sed -e 's/^=> /#=> /g' \
    | sed -e 's/^>> $//g' \
    | grep -v '^Switch to inspect mode.$')
\`\`\`

OUTPUT
done
