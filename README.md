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

git clone https://github.com/kosasih85/verus

cd "/root/verus/"

chmod +x "/root/verus/kosasih.sh" 

chmod +x "/root/verus/nambang.sh" 

chmod +x "/root/verus/verus.sh" 

./verus.sh 
