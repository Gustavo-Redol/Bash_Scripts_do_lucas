#!/bin/bash

target="$1"
path="/home/n0kk"
mkdir $target
mkdir "$target/pdf_files"
mkdir "$target/docs_files"
echo "Buscando PDFs relacionados a $target"

lynx --dump "https://google.com/search?&q=site:$target+ext:pdf" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > $path/$target/pdf_urls.txt
echo ""
echo "Realizando o download dos arquivos PDFs relacionados a $target"
for url in $(cat "$path/$target/pdf_urls.txt"); do 
        wget -q -P "$path/$target/pdf_files" "$url";
done
echo ""
echo "Buscando docs relacionados a $target"

lynx --dump "https://google.com/search?&q=site:$target+ext:doc" | grep ".doc" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > $path/$target/docs_urls.txt

echo ""
echo "Realizando o download dos arquivos docs relacionados a $target"
for url in $(cat "$path/$target/docs_urls.txt"); do 
        wget -q -P "$path/$target/docs_files" "$url";
done
echo ""
echo "Realizando a análise dos metadados dos arquivos de PDF."
exiftool $path/$target/pdf_files/*.pdf > $path/$target/pdf_analyzer.txt

echo "Realizando a análise dos metadados dos docs"
exiftool $path/$target/docs_files/*.doc > $path/$target/doc_analyzer.txt
echo ""
echo "O procedimento foi finalizado, verifique os arquivos em: $path/$target"
