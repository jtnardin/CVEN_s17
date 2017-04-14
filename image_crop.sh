#!/bin/bash
# image_crop.sh written 4-14-2017 by JTN to crop images into 10 separate images and watch cells migrate past these regions. They will later be concatenated in imagej


for l in  B 
do

	for k in 5
	do
		
		let count=1

		for i in {1..2}
		do	
			let iprime=i-1


			for j in {1..5}
			do
				let jprime=j-1

				let y0=0+iprime*270 
				let x0=4+jprime*108

				#echo "$y0"
				#echo "$x0"

				convert -brightness-contrast 0 "WL_3_well "$l"0"$k".tif" -crop 100x270+$x0+$y0 "WL_3_well "$l"0"$k"_"$count".tif" 
		
				#echo "WL_3_well "$l"0"$k"_"$count".tif"
				let count=count+1
	
			done	


		done
	done
done
