# gboot
gboot for orange pi one

1.load source code:
git clone https://github.com/zzwd/gboot.git

2.compile:
cd gboot
make

3.add checksum:
cd tools
make
./mksunxiboot ../gboot.bin gboot-sdcard.bin

4.burn to sdcard
sudo mkfs.vfat -I /dev/sdb
sudo dd if=gboot-sdcard.bin of=/dev/sdb bs=1k seek=8


