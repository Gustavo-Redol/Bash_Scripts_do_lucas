#!/bin/bash

for brute in $(cat list.txt);
do
	host $brute.$1 | grep -v "NXDOMAIN"

done
