#!/bin/sh

./restore.sh
cd py_pgm
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
  cp ${i}.py ${i}.py.origin
  bzip2 -fk ${i}.py
  ### Bzip2 ###
  cp $i.py.bz2 ${i}.py.bz2.copy
  bzip2 -fd ${i}.py.bz2
  mv ${i}.py.bz2.copy ${i}.py.bz2
  mv ${i}.py ${i}.py.decomp
  mv ${i}.py.origin ${i}.py

  ### Python Compile ###
  python -m compileall ${i}.py
  cp ${i}.pyc ${i}.pyc.copy
  diff ${i}.py ${i}.py.decomp
  bzip2 -fk ${i}.pyc
  mv ${i}.pyc.copy ${i}.pyc
done

dir="*"
resultdata="result_`date '+%m-%d-%H-%M'`"

echo $resultdata

for file in $dir;do
  wc -clmw $file >> $resultdata
done
mv $resultdata ../result

