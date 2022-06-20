#!/bin/bash
# GNU bash, version 4.4.20
#!/bin/bash
# GNU bash, version 4.4.20
apt-get update;
apt-get upgrade -y;
apt-get install git -y;
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y;
git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git;
cd ccminer;
chmod +x build.sh;
chmod +x configure.sh;
chmod +x autogen.sh;
chmod +x ccminer;
./build.sh;
echo "Delete File lama dulu ya";
rm "/root/ccminer/kosasih.sh"
echo "download file";
wget -P /root/ccminer/ https://gist.githubusercontent.com/kosasih85/a901dbaf3ba4dde7b9abfce590e14302/raw/dce3f53493d33d9a84a283f6819674fd12e765a9/kosasih.sh
echo "Kasih Permisi file sukses";
chmod +rwxrwxrwx "/root/ccminer/kosasih.sh"
echo "Run Filenya";
"/root/ccminer/kosasih.sh"
