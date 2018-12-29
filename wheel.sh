#!/bin/bash
pre=""
curr="1"
pre_key="a"

#set the game window to focus
xdotool search --onlyvisible --class supertux windowactivate;

#get the car going straight
xdotool keydown Up;

#100 in the middle ;73 far right; 150 far left
#< 80 right ; >130 left
	
while read line
do
	#xdotool keydown Up;
	
	#xdotool keyup $pre_key
	#get the id of the 002 packet with the thired last byte
        curr=`echo "$line" |cut -d" " -f8`
	flag=`echo "$line" |cut -d" " -f9`
	if [ "$curr" != "" ] 
	then
		#means there is new info about the wheel
		wheel=$(( 16#$curr ))
		echo $wheel	
		
		#check wheel value and issue control command accordingly
		if ([ "$wheel" -lt 125 ] && [ "$flag" = "00" ]) || [ "$flag" = "01" ] 
		then 
			if [ "$pre_key" != "Right" ]
			then

				xdotool keyup $pre_key
				xdotool keydown Right
				pre_key="Right"
			fi
		fi
		if ([ "$wheel" -gt 125 ] && [ "$flag" = "FF" ]) || [ "$flag" = "FE" ]
		then
			if [ "$pre_key" != "Left" ]
			then
				xdotool keyup $pre_key
				xdotool keydown Left
				pre_key="Left"
			fi
		fi	
	fi
done

