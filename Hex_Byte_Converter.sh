#!/bin/bash
for hexbyte in $(cat arquivo.txt);
do
    printf "%d\n" 0x$hexbyte >> ascii.txt
done

