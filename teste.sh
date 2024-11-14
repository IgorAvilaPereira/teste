#!/bin/bash  

#script="teste"

git add * && git commit -m $1 && git push

echo "# $1 <br>" > "README.md"
echo "# $1 <br>" > "./../$1.wiki/Home.md"

for d in ./*; do
	if [ "$d" != "./README.md" ]; then
		#if ["$d" != "./teste.sh"]; then
			echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "README.md"
		        echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "./../$1.wiki/Home.md"
		#fi
	fi
done

git add * && git commit -m $1 && git push
cd "./../$1.wiki/" && git add * && git commit -m $1 && git push
