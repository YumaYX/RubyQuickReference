#!/bin/sh

cd codes

echo '# Ruby Quick Reference'
echo

ls -1 *.rb | while read line
do
  cat <<RUBYSCRIPTEOF

## $(basename ${line})

\`\`\`ruby
$(cat ${line})
\`\`\`
RUBYSCRIPTEOF
  result=$(ruby ${line})
  if [ ! -z "${result}" ] ; then
  cat <<OUTPUT

### Result

\`\`\`
$result
\`\`\`
OUTPUT
  fi
done
