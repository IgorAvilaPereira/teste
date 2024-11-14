#!/bin/bash  

git add * && git commit -m $2 && git push

echo "# $1 <br>" > "README.md"
echo "# $1 <br>" > "./../$1.wiki/Home.md"

search_dir=$1

for entry in "$search_dir"/* do
	echo $entry
    	#echo "## $2 <br> <br> [Acessar](https://github.com/IgorAvilaPereira/$1/tree/main/$entry) <br>" >> "README.md"
	#echo "## $2 <br> <br> [Acessar](https://github.com/IgorAvilaPereira/$1/tree/main/$entry) <br>" >> "./../$1.wiki/Home.md"
done

git add * && git commit -m $2 && git push
cd "./../$1.wiki/" && git add * && git commit -m $2 && git push
