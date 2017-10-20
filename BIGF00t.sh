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

echo "Welcome to BIGF00t.sh v1.0 by bus7d"
echo "To Use this tool you have to launch your masscan command with '>> largescan.dat'at the end"
echo "Then you have to copy largescan.dat to the BIGF00t/ Directory"
echo "BIGF00t.sh will work on this data to give you the hand on it and easily find anything you want between thousands of scanz"
echo "--------------------------------------------------------------------------------------------------------------------------";
echo "Patience is a virtue.."
echo "Now we gonna play hard..."
echo "--------------------------------------------------------------------------------------------------------------------------";
portnum=$(wc -l largescan.dat|cut -d " " -f 1)
echo "We found $portnum portz open on the ranges"echo "The result of your search is stored in /hosts/$service.host"
echo "--------------------------------------------------------------------------------------------------------------------------";
cat  largescan.dat|cut -d " " -f 6 | sort -u >> DATA/alive.list #alive host list from open port list
echo "Alive Host List"
cat DATA/alive.list
echo "---------------------------------------------------------------------------------------------------------------------------";
echo "Building Hosts Files.."
echo "----------------------------------------------------------------------";
for ip in $(cat DATA/alive.list); do grep $ip largescan.dat >> ports/$ip;done #host files with list of open ports 

echo "DONE! Now you have a file for each alive host with their open ports check with 'ls ports/ in another terminal[Ctrl+Shift+T]'"

for ip in $(ls ports/);do wc -l ports/$ip >> DATA/port.rank; done
echo "Host Port Ranking List"
echo "Look at Top and Bottom of List interesting hosts could be within..."
cat DATA/port.rank |sort -rn

while true ; do
	echo "-------------------------------------------------------"
	echo "Play Again?"
	echo "You could list by port number"
	echo "The result of your search is stored in /hosts/$service.host"
	read service
	echo "Looking for open port $service Hosts"
	grep -r -w "$service" ports/ >> hosts/$service.host
	cat hosts/$service.host|cut -d " " -f 6 |sort -u
done

