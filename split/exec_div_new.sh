#!/bin/sh


NRN=./x86_64/special
TMP=tmp.txt
FILENAME=./split${DIV}.txt

DIV=8
FILENAME=./split${DIV}.txt
mpiexec -n $DIV $NRN -mpi -NSTACK 80000 -NFRAME 2000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=16
FILENAME=./split${DIV}.txt
mpiexec -n $DIV $NRN -mpi -NSTACK 80000 -NFRAME 2000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=32
FILENAME=./split${DIV}.txt
mpiexec -n $DIV $NRN -mpi -NSTACK 80000 -NFRAME 2000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=64
FILENAME=./split${DIV}.txt
mpiexec -n $DIV $NRN -mpi -NSTACK 80000 -NFRAME 2000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

DIV=128
FILENAME=./split${DIV}.txt
mpiexec -n $DIV $NRN -mpi -NSTACK 80000 -NFRAME 2000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME
