#!/bin/sh

current_date=`date +"%Y-%m-%d"`
source="$1/$current_date-*.md"
blogroot="$2"
target="$blogroot/source/_posts/"

for file in $source
do
    if [ ! -f "$file" ]
    then
        continue
    fi

    echo "Moving $file to $target"
    mv $file $target/
done

cd $target
git add .
git commit -m 'scheduled posts'
git push origin source

cd $blogroot

echo "Publishing..."
./gh-pages.sh
