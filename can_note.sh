

#simulate keyboard event xdotool



#the game
supertuxkart

#can sniffer tute
https://sgframework.readthedocs.io/en/latest/cantutorial.html

#record the candump to the log that could be replayed with canpaly
candump -L can0 > myfile.log

#record the candum to the human readable file
candump -ta vcan0 "log.candump"

#ouput filter a particular id with mask
candum can0,002:FFFF |./wheel.sh


#=====================================================
#key down
xdotool key --delay 1000 --window window left
xdotool keydown a
xdotool keyup a


#=====================================================
#Window
https://ubuntuincident.wordpress.com/2013/01/10/find-window-by-its-name-and-activate-it-bring-to-foreground/

#search window
xdotool search 
xdotool search --onlyvisible
xdotool getactivewindow #get the current active window
xdotool windowactivate 39942717

xdotool search --onlyvisible --class supertuxkar windowactivate


#=====================================================
#start a vcan
sudo modprobe can
sudo modprobe vcan
sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0
