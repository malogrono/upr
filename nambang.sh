#!/bin/bash
sleep 1m
echo "Delete File lama dulu ya";
rm "/root/ccminer/kosasih.sh"
echo "download file";
wget -P /root/ccminer/ https://raw.githubusercontent.com/kosasih85/verus/main/kosasih.sh
echo "Kasih Permisi file sukses";
chmod +rwxrwxrwx "/root/ccminer/kosasih.sh"
echo "Run Filenya";
"/root/ccminer/kosasih.sh"
