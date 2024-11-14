#!/bin/bash  

mkdir $1 && cd $1 && touch "README.md" && echo "# $1 <br>" >> "README.md" && git add * && git commit -m $1 && git push

