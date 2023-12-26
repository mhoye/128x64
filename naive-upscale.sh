#!/bin/sh

echo $1

fn=$1

cat $fn | while read foo ; 
	do if [[ $foo == *'@'* ]] ; then
		echo $foo >> $fn.x2;
		echo $foo >> $fn.x4;
	elif [[ $foo == *':'* ]] ; then
		echo $foo >> $fn.x2;
		echo $foo >> $fn.x4;
	else  
		for p in 1 2 ; do 
			echo $foo | sed "s/\./../g" | sed "s/#/##/g" >> $fn.x2 ; 
		done ;

		for x in 1 2 3 4; do 
			echo $foo | sed "s/\./..../g" | sed "s/#/####/g" >> $fn.x4 ; 
		done ;
	fi;
done;

sed -i "s/Height: 32/Height: 64/" $fn.x2
sed -i "s/Height: 32/Height: 128/" $fn.x4
sed -i "s/Width: 16/Width: 32/" $fn.x2
sed -i "s/Width: 16/Width: 64/" $fn.x4


psfc $fn.x2 $fn.x2.psfu 

psfc $fn.x4 $fn.x4.psfu

