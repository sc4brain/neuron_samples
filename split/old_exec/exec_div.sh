#!/bin/sh

DIV=256
TMP=tmp.txt
FILENAME=div256.spl


mpiexec -n $DIV ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc > $TMP
cat $TMP | grep EXIST > $FILENAME
cat $TMP | grep MSPLIT >> $FILENAME

