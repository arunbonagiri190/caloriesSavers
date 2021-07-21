function tune(){

	echo "## powertop auto tuning..."
	sudo powertop --auto-tune
	echo "## Starting tlp..."
	sudo tlp start 
	echo "## disabling ethernet..."
	sudo ip link set enp0s25 down
	echo "## Done, hope you got a more battery!"
}

tune
