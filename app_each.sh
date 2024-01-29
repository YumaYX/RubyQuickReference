#!/bin/sh

cd codes

ls -1 *.rb | while read line
do
  page="./../${line%.*}.markdown"

  echo "# $(basename ${line})" > ${page}
  echo >> ${page}

  if [ -f "${line%.*}.md" ]; then
    cat ${line%.*}.md >> ${page}
    echo >> ${page}
  fi

  cat <<OUTPUT >> ${page}
\`\`\`ruby
$(irb --prompt simple ${line} \
    | sed -e '$d' \
    | sed -e 's/^=> /#=> /g' \
    | sed -e 's/^>> $//g' \
    | grep -v '^Switch to inspect mode.$')
\`\`\`

OUTPUT
done
