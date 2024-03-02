#!/bin/bash
salt="0THoc4SA"
for word in $(cat /home/n0kk/rock-mini.txt);do
        hash=$(mkpasswd -m sha-512 "$word" -S "$salt")
        echo "$word - $hash" >> /home/n0kk/sha512_lab.txt
done

