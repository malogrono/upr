#!/bin/bash
echo "Delete File lama dulu ya";
rm "/root/ccminer/kosasih.sh"
echo "download file";
wget -P /root/ccminer/ https://gist.githubusercontent.com/kosasih85/a901dbaf3ba4dde7b9abfce590e14302/raw/dce3f53493d33d9a84a283f6819674fd12e765a9/kosasih.sh
echo "Kasih Permisi file sukses";
chmod +rwxrwxrwx "/root/ccminer/kosasih.sh"
echo "Run Filenya";
"/root/ccminer/kosasih.sh"
