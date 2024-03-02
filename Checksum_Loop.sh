#!/bin/bash

for exe in $(cat /home/n0kk/zoom_list.txt); do
	md5sum /home/n0kk/integridade/$exe
done
