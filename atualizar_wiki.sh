#!/bin/bash  
git pull
echo "# "${PWD##*/}" <br>" > "README.md"
echo "# "${PWD##*/}" <br>" > "./../"${PWD##*/}".wiki/Home.md"
echo "Listando todos os diretorios de "${PWD##*/}""
for d in ./*; do
	if [[ "$d" != "./README.md"  && "$d" != "./atualizar_wiki.sh" && "$d" != "./nova_aula.sh" ]]; then
		echo "## [$d](https://github.com/IgorAvilaPereira/"${PWD##*/}"/tree/main/$d) <br>" >> "README.md"		
		echo "## [$d](https://github.com/IgorAvilaPereira/"${PWD##*/}"/tree/main/$d) <br>" >> "./../"${PWD##*/}".wiki/Home.md"
		cd $d				
		# echo *.*
		for d2 in *.*; do
			# echo "$d2"
		# 	# if [[ "$d2" != ]]; then			
				# https://github.com/IgorAvilaPereira/teste/blob/main/aula1/teste.txt
				echo "[$d2](https://github.com/IgorAvilaPereira/"${PWD##*/}"/blob/main/$d/$d2) <br>" >> "./../README.md"		
				echo "[$d2](https://github.com/IgorAvilaPereira/"${PWD##*/}"/blob/main/$d/$d2) <br>" >> "./../../"${PWD##*/}".wiki/Home.md"			
		# 	# fi
		done
		for i in */; do 			
			if [[ -d "$i" && ! -L "$i" ]]; then
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/"${PWD##*/}"/blob/main/$d/${i%%/}) <br>" >> "./../README.md"		
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/"${PWD##*/}"/blob/main/$d/${i%%/}) <br>" >> "./../../"${PWD##*/}".wiki/Home.md"	
			fi
		done
		cd ..
	fi
done
git add * && git commit -m "${PWD##*/}" && git push
cd "./../"${PWD##*/}".wiki/" && git add * && git commit -m "${PWD##*/}" && git push