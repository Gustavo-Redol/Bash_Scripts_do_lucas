#!/bin/bash

echo "Digite a última casa do primeiro IP do range: "
read first_num

echo "Digite a última casa do último IP do range: "
read last_num

for range in $(seq $first_num $last_num);
do
host -t ptr $1.$range | grep -v "$1"
done


