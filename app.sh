#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

ls -1 *.rb | while read line
do
  echo "## $(basename ${line})"

  if [ -f "${line%.*}.md" ]; then
    echo
    cat ${line%.*}.md
  fi

  cat <<RUBYSCRIPTEOF

\`\`\`ruby
$(cat ${line})
\`\`\`
RUBYSCRIPTEOF
  result=$(irb --prompt simple ${line} \
    | sed -e '$d' \
    | sed -e 's/^=> /#=> /g;s/^>> //g' \
    | grep -v '^Switch to inspect mode.$')
  if [ ! -z "${result}" ] ; then
  cat <<OUTPUT

\`\`\`
$result
\`\`\`
OUTPUT
  fi
done
