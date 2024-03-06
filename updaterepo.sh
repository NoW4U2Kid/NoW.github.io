#!/bin/bash
#Make Packages files
cd "/home/abaan/Development/NoW.github.io"

rm -rf Packages* Release*
apt-ftparchive packages ./debs > Packages
bzip2 -c9 Packages > Packages.bz2
xz -c9 Packages > Packages.xz
xz -5fkev --format=lzma Packages > Packages.lzma
lz4 -c9 Packages > Packages.lz4
gzip -c9 Packages > Packages.gz
zstd -c19 Packages > Packages.zst
apt-ftparchive release . > tmp
cat Base tmp > Release
rm tmp

# #Upload to GitHub
# cd "/home/abaan/Development/NoW.github.io"
# git add -A
# git commit -m "Repo update"
# git push -u origin master