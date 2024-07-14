#!/bin/sh

cd _codes
rubyversion=$(ruby -v | awk '{print $2}')

ls -d * | while read dir_n
do
  cd "${dir_n}"
  
  ls -1 *.rb | while read line
  do    
    page="./../../"${dir_n}"_${line%.*}.markdown"
    
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
    | grep -v '^Switch to inspect mode.$' || exit 2)
\`\`\`

Executed with Ruby \`${rubyversion}\`
OUTPUT
  done

  cd ..
done
