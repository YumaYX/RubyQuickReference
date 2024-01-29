#!/bin/sh

mkdir each
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
  page="./../each/${line%.*}.md"

  echo '---'
  echo
  echo "# $(basename ${line})" | tee ${page}
  echo | tee -a ${page}

  if [ -f "${line%.*}.md" ]; then
    cat ${line%.*}.md | tee -a ${page}
    echo | tee -a ${page}
  fi

  cat <<OUTPUT | tee -a ${page}
\`\`\`ruby
$(irb --prompt simple ${line} \
    | sed -e '$d' \
    | sed -e 's/^=> /#=> /g' \
    | sed -e 's/^>> $//g' \
    | grep -v '^Switch to inspect mode.$')
\`\`\`

OUTPUT
done