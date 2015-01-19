#!/bin/sh

DIV=8
TMP=tmp.txt
FILENAME=../hoc/spl/Swc_BN_1056_div1.spl

mpiexec -n 1 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc | tee > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME


DIV=16
TMP=tmp.txt
FILENAME=../hoc/spl/Swc_BN_1056_div2.spl

mpiexec -n 2 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc | tee > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=32
TMP=tmp.txt
FILENAME=../hoc/spl/Swc_BN_1056_div4.spl

mpiexec -n 4 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc | tee > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=64
TMP=tmp.txt
FILENAME=../hoc/spl/Swc_BN_1056_div8.spl

mpiexec -n 8 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc | tee > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME


DIV=128
TMP=tmp.txt
FILENAME=../hoc/spl/Swc_BN_1056_div16.spl

mpiexec -n 16 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc | tee > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME
