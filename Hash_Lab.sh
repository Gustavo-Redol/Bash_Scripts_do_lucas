#!/bin/bash

for word in $(cat /usr/share/john/password.lst); do
    md5hash=$(echo -n "$word" | md5sum | tr -d '-' | cut -d ' ' -f1)
    base64encode=$(echo -n "$md5hash" | base64)
    sha1hash=$(echo -n "$base64encode" | sha1sum | cut -d ' ' -f1)
    echo "$word $sha1hash" >> /home/n0kk/sha1sumhash.txt
done

