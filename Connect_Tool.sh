#!/bin/bash


for portc in $(cat dst_ports.txt); do
	echo "Connected on $1 on port $portc"
	nc -vn $1 $portc
done
