# verus
script buat verus mining (armbian)

#verus.sh
file untuk auto install ccminer dan set mining ke zergpool
caranya download verus.sh, copy ke root
set permission nya, lalu jalankan

#nambang.sh
script untuk nambang dengan cara download file dari github , agar mempermudah jika ada banyak stb dan untuk mining coin lain

#kosasih.sh
perintah untuk nambang degan ccminer

Cara install

#################################################################################
buat crontab dulu
#################################################################################
perintah nya :

crontab -e

lalu isi paling bawah baris ini 

@reboot bash /root/ccminer/nambang.sh > /root/ccminer/miner.log 2>&1

##################################################################################

setelah buat crontab copy dari bawah ini sampai baris bawah di terminal emulator dengan root access

git clone https://github.com/kosasih85/verus

cd "/root/verus/"

chmod +x "/root/verus/kosasih.sh"

chmod +x "/root/verus/nambang.sh"

chmod +x "/root/verus/verus.sh"

./verus.sh

cd

"verus/verus.sh"

##################################################################################
