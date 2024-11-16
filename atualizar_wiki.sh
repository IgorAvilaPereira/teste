#!/bin/bash  
git pull
echo "# $1 <br>" > "README.md"
# se tiver wiki
echo "# $1 <br>" > "./../$1.wiki/Home.md"
for d in ./*; do
	if [[ "$d" != "./README.md"  && "$d" != "./atualizar_readme.sh" && "$d" != "./nova_aula.sh" ]]; then
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "README.md"		
		# se tiver wiki
		echo "## [$d](https://github.com/IgorAvilaPereira/$1/tree/main/$d) <br>" >> "./../$1.wiki/Home.md"
		
		cd $d								
		for d2 in *.*; do
			echo "[$d2](https://github.com/IgorAvilaPereira/$1/blob/main/$d/$d2) <br>" >> "./../README.md"		
			# se tiver wiki
			echo "[$d2](https://github.com/IgorAvilaPereira/$1/blob/main/$d/$d2) <br>" >> "./../../$1.wiki/Home.md"					
		done

		for i in */; do 			
			if [[ -d "$i" && ! -L "$i" ]]; then
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/$1/blob/main/$d/${i%%/}) <br>" >> "./../README.md"		
				# se tiver wiki
				echo "[${i%%/}](https://github.com/IgorAvilaPereira/$1/blob/main/$d/${i%%/}) <br>" >> "./../../$1.wiki/Home.md"	
			fi
		done
		cd ..
	fi
done
git add * && git commit -m $1 && git push
# se tiver wiki
cd "./../$1.wiki/" && git add * && git commit -m $1 && git push