#!/bin/bash  

echo "Processo de atualizacao do repositorio $1 e de sua wiki"
git pull
echo "# $1 <br>" > "README.md"
echo "# $1 <br>" > "./../$1.wiki/Home.md"
echo "Listando todos os diretorios de $1"
for d in ./*; do
	if [[ "$d" != "./README.md"  && "$d" != "./atualizar_wiki.sh" && "$d" != "./nova_aula.sh" ]]; then
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "README.md"		
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "./../$1.wiki/Home.md"
		
		for d2 in "./$d/*"; do
			echo $d2
			# echo "[$d2](https://github.com/IgorAvilaPereira/$1/tree/main/$d2) <br>" >> "README.md"		
			# echo "[$d2](https://github.com/IgorAvilaPereira/$1/tree/main/$d2) <br>" >> "./../$1.wiki/Home.md"			
		done
	fi
done
echo "Atualizando o readme"
git add * && git commit -m $1 && git push
echo "Atualizando o home da wiki"
cd "./../$1.wiki/" && git add * && git commit -m $1 && git push
echo "Processo finalizado!"