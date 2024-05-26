#!/bin/sh

cd codes
rubyversion=$(ruby -v | awk '{print $2}')

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
    | sed -e 's/^\?>   //g' \
    | sed -e 's/^>> $//g' \
    | sed -e 's/^.> //g' \
    | sed -e 's/^\.\.\.//g' \
    | sed -e 's/  end$/end/g' \
    | grep -v '^Switch to inspect mode.$')
\`\`\`

Executed with Ruby \`${rubyversion}\`

\`\`\`sh
irb --prompt simple ${line}
\`\`\`
OUTPUT
done
