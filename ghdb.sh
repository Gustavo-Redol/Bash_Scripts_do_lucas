#!/bin/bash
browsercall="firefox"
target="$1"

echo "Pesquisa no Pastebin"
$browsercall "https://google.com/search?q=site:pastebin.com+$target" 2> /dev/null

echo "Pesquisa no Trello"
$browsercall "https://google.com/search?q=site:trello.com+$target" 2> /dev/null


echo "Pesquisa por arquivos"
$browsercall "https://google.com/search?q=site:$target+ext:php+OR+ext:asp" 2> /dev/null
