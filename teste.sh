#!/bin/bash  

echo "# $1 <br>" > "README.md"
echo "# $1 <br>" > "./../$1.wiki/Home.md"

search_dir=$2
for entry in "$search_dir"/*
do
    	echo "## $2 <br>" >> "README.md"
	echo "## $2 <br>" >> "./../$1.wiki/Home.md"
done

git add * && git commit -m $2 && git push
cd "./../$1.wiki/" && git add * && git commit -m $2 && git push
