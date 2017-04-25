#!/bin/bash
set -x
dir=`ls`
for i in $dir
do
    cd $i
    i=`echo $i | sed 's/\/$//'`
    file=`ls $i*`
    for j in $file
    do
        j=`echo $j | awk -F '.' '{print $4}'`
	echo $i"."$j >> entries.txt
    done
	files =`cat entries.txt | sort -u`
    sed '/<div id="jstree">/,$d' index.html >> index2.html
	sed '/</div>/,$d' index.html >> index3.html
	mv index2.html index_$1.html
	echo '<div id="jstree">' >> index_$1.html
	echo "<ul>" >> index_$1.html
	echo "<li id="$i" data-jstree='{"opened":false, "selected":true, "checked":true}'>$i" >> index_$1.html
	echo "<ul>" >> index_$1.html
	for j in $c_dir
	do
		echo "<li id="$j">$j</li>" >> index_$1.html
	done
	echo "</ul>">> index_$1.html
	echo "</li>">> index_$1.html
	echo "</div>" >> index_$1.html
	echo `cat index3.html` >> index_$1.html
done    
