#!/bin/bash  

git pull
git add *
git commit -m 'atualizando'
git push

repositorio=${PWD##*/}
echo "# $repositorio \\n" > "README.md"
echo "# $repositorio \\n" > "./../"$repositorio".wiki/Home.md"

# listando tudo interno ao repositorio
for d in ./*; do

	if [[ "$d" != "./README.md"  && "$d" != "./atualizar.sh" && "$d" != "./nova_aula.sh" ]]; then
		echo "## [$d](https://github.com/IgorAvilaPereira/"$repositorio"/tree/main/$d) \\n" >> "README.md"		
		# se n tiver wiki, favor comentar
		echo "## [$d](https://github.com/IgorAvilaPereira/"$repositorio"/tree/main/$d) \\n" >> "./../"$repositorio".wiki/Home.md"		
		cd $d							

		# documentos do subdiretorio de cada aula
		for d2 in *.*; do
			echo "[$d2](https://github.com/IgorAvilaPereira/"$repositorio"/blob/main/$d/$d2) \\n" >> "./../README.md"		
			# se n tiver wiki, favor comentar
			echo "[$d2](https://github.com/IgorAvilaPereira/"$repositorio"/blob/main/$d/$d2) \\n" >> "./../../"$repositorio".wiki/Home.md"					
		done

		# subdiretorios internos de cada aula
		for i in */; do 			
			if [[ -d "$i" && ! -L "$i" ]]; then
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/"$repositorio"/blob/main/$d/${i%%/}) \\n" >> "./../README.md"		
				# se n tiver wiki, favor comentar
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/"$repositorio"/blob/main/$d/${i%%/}) \\n" >> "./../../"$repositorio".wiki/Home.md"	
			fi
		done
		cd ..
	fi
done

git add * && git commit -m 'atualizando' && git push
# se n tiver wiki, favor comentar
cd "./../"$repositorio".wiki/" && git add * && git commit -m 'atualizando' && git push
