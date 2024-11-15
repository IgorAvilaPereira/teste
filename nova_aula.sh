#!/bin/bash  

# $1 => repository
# $2 => pasta aula
mkdir $2 && cd $2 && touch "README.md" && echo "# $2 <br>" >> "README.md" && git add * && git commit -m $2 && git push
cd ./../
git pull

echo "Atualizando o repositorio $1 e sua wiki"
echo "# $1 <br>" > "README.md"
echo "# $1 <br>" > "./../$1.wiki/Home.md"
for d in ./*; do
	if [[ "$d" != "./README.md"  && "$d" != "./atualizar_wiki.sh" && "$d" != "./nova_aula.sh" ]]; then
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "README.md"
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "./../$1.wiki/Home.md"
	fi
done
git add * && git commit -m $1 && git push
cd "./../$1.wiki/" && git add * && git commit -m $1 && git push
echo "Processo de Atualizacao - ok"
#mkdir $2 && cd $2 && touch "README.md" && echo "# $2 <br>" >> "README.md" && git add * && git commit -m $2 && git push

