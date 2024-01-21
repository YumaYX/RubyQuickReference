#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

ls -1 *.rb | while read line
do
  echo "## $(basename ${line})"
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
