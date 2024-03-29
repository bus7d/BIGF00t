#!/bin/bash
mkdir DATA
mkdir ports
mkdir hosts
rm ports/* 
rm DATA/alive.list
rm DATA/port.rank
rm hosts/*
echo "-------------------------------------------------------";
echo "██████╗ ██╗ ██████╗ ███████╗ ██████╗  ██████╗ ████████╗";
echo "██╔══██╗██║██╔════╝ ██╔════╝██╔═████╗██╔═████╗╚══██╔══╝";
echo "██████╔╝██║██║  ███╗█████╗  ██║██╔██║██║██╔██║   ██║   ";
echo "██╔══██╗██║██║   ██║██╔══╝  ████╔╝██║████╔╝██║   ██║   ";
echo "██████╔╝██║╚██████╔╝██║     ╚██████╔╝╚██████╔╝   ██║   ";
echo "╚═════╝ ╚═╝ ╚═════╝ ╚═╝      ╚═════╝  ╚═════╝    ╚═╝ v1";
echo "-------------------------------------------------------";

echo "Welcome to BIGF00t.sh v1.3 by bus7d 2017"
echo "To Use this tool you have to launch your masscan command with '>> largescan.dat'at the end"
echo "Then you have to copy largescan.dat to the BIGF00t/ Directory"
echo "BIGF00t.sh will work on this data to give you the hand on it and easily find anything you want between thousands of scanz"
echo "--------------------------------------------------------------------------------------------------------------------------";
echo "Patience is a virtue.."
echo "Now we gonna play hard..."
echo "--------------------------------------------------------------------------------------------------------------------------";
cat  largescan.dat|grep Discovered |cut -d " " -f 6 | sort -u >> DATA/alive.list #alive host list from open port list
echo "Alive Host List"
alivenum=$(wc -l DATA/alive.list) 
echo "We found $alivenum hosts alive"
cat DATA/alive.list
echo "---------------------------------------------------------------------------------------------------------------------------";
echo "Building Hosts Files.."
echo "----------------------------------------------------------------------";
for ip in $(cat DATA/alive.list); do grep -w $ip largescan.dat|sort -u >> ports/$ip;done #host files with list of open ports 

echo "DONE! Now you have a file for each alive host with their open ports check with 'ls ports/ in another terminal[Ctrl+Shift+T]'"

for ip in $(ls ports/);do wc -l ports/$ip >> DATA/port.rank; done
echo "Host Port Ranking List"
echo "Look at Top and Bottom of List interesting hosts could be within..."
cat DATA/port.rank |sort -rn
echo "---------------------------------------------------------------------------------------------------------------------------";
echo " TCP Port Listing:"
echo "---------------------------------------------------------------------------------------------------------------------------";
cat largescan.dat|grep Discovered|grep -v delay|grep -v report|cut -d " " -f 4 |sort -u|cut -d "/" -f 1 |sort -V |tree > tcp_port_list.txt
echo "---------------------------------------------------------------------------------------------------------------------------";
portnum=$(wc -l tcp_port_list.txt|cut -d " " -f 1)
echo "We found $portnum ports open on the range(s)"
echo "--------------------------------------------------------------------------------------------------------------------------";

echo "Launching Heavy Search Engine:"
while true ; do
	
	echo "---------------------------------------------------------------------------------------------------------------------------";
	echo "You could list by port number or display the TCP Port List with [list]"
	
	read service

	if [ $service = "list" ] ; then 
		echo " TCP Port Listing:"
		echo "---------------------------------------------------------------------------------------------------------------------------";
		cat largescan.dat|grep Discovered|grep -v delay|grep -v report|cut -d " " -f 4 |sort -u|cut -d "/" -f 1 |sort -V
		echo "---------------------------------------------------------------------------------------------------------------------------";
	else


		echo "Looking for open port TCP $service Hosts"
		grep -r -w "$service" ports/ >> hosts/$service.host
		echo "The result of your search is stored in /hosts/$service.host"
		cat hosts/$service.host|cut -d " " -f 6 |sort -u
		echo "Play Again?"
	fi
done
