#!/usr/bin/bash
function print_CPU_Usage()
{
	#top -bn1 | grep load | awk '{printf "CPU \t:\t %.2f%%\n",$(NF-2)}'
	top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU \t:\t", 100 - $1,"%"}'
}

function print_RAM_Usage()
{
	free -m | awk 'NR==2{printf "RAM \t:\t %s/%sMB (%.2f%%)\n",$3, $2, $3*100/$2 }'
}

function print_Disk_Usage()
{
	df -h | awk '$NF=="/"{printf "Disk \t:\t %d/%dGB \t(%s)\n", $3, $2, $5}'
}

function print_Battery_Usage()
{
	upower -i $(upower -e | grep '/battery') | grep --color=never -E "percentage" | awk '{printf "Battery :\t %s\n", $2}'
}

function print_ipAddress()
{
	ip r | grep 'default' | awk '{printf "IP Addr :\t %s\n", $3}'
}
print_CPU_Usage
print_RAM_Usage
print_Disk_Usage
print_Battery_Usage
print_ipAddress
