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
		cd $d				
		# echo *.*
		for d2 in *.*; do
			# echo "$d2"
		# 	# if [[ "$d2" != ]]; then			
				# https://github.com/IgorAvilaPereira/teste/blob/main/aula1/teste.txt
				echo "[$d2](https://github.com/IgorAvilaPereira/$1/blob/main/$d/$d2) <br>" >> "./../README.md"		
				echo "[$d2](https://github.com/IgorAvilaPereira/$1/blob/main/$d/$d2) <br>" >> "./../../$1.wiki/Home.md"			
		# 	# fi
		done

		for i in */; do 			
			if [[ -d "$i" && ! -L "$i" ]]; then
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/$1/blob/main/$d/${i%%/}) <br>" >> "./../README.md"		
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/$1/blob/main/$d/${i%%/}) <br>" >> "./../../$1.wiki/Home.md"	
			fi
		done
		cd ..
	fi
done
echo "Atualizando o readme"
git add * && git commit -m $1 && git push
echo "Atualizando o home da wiki"
cd "./../$1.wiki/" && git add * && git commit -m $1 && git push
echo "Processo finalizado!"