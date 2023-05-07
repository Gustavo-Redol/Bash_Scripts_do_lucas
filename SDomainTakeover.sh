#!/bin/bash

for brute in $(cat /home/n0kk/dnsenum.txt); do
    host -t cname $brute.$1 | grep "alias for"
    
done
