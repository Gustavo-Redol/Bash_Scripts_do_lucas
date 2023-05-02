#!/bin/bash

for brute in $(cat /home/n0kk/dnsenum.txt);
do
	host $brute.$1 | grep -v "NXDOMAIN"

done
