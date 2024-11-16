#!/bin/bash  
mkdir $1 && cd $1 && touch "README.md" && echo "# $1 <br>" >> "README.md" && cd ./../ && git add * && git commit -m $1 && git push 
repositorio=basename "$PWD"
echo $repositorio
# ./atualizar_wiki.sh repositorio