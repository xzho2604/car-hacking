#!/bin/bash
pre=""
curr="1"
pre_key="a"
pre_flag=""



#100 in the middle ;73 far right; 150 far left
#< 80 right ; >130 left
	
while read line
do
		
	#get the id of the 002 packet with the thired last byte
	#30 - 31 first byte , 32-33 second byte
        curr=`echo "$line" |cut -d" " -f8` #degree turn
	flag=`echo "$line" |cut -d" " -f9` #FF left 00 right
	
	if [ "$curr" != "" ] 
	then
		#means there is new info about the wheel
		pre=$curr
		pre_flag=$flag
		wheel=$(( 16#$curr ))
		echo $wheel $flag
		
		#check wheel value and issue control command accordingly
		if ([ "$wheel" -gt 125 ] && [ "$flag" = "00" ]) || [ "$flag" = "01" ]
		then 
			echo "right"
			continue
		fi

		if ([ "$wheel" -lt 125 ] && [ "$flag" = "FF" ]) || [ "$flag" = "FE" ] 
		then
			echo "left"
			continue
		fi	
		echo "Up"
	fi
done

