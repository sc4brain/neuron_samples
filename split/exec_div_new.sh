#!/bin/sh

NRN=~/github/neuron_kplus/exec_icc/x86_64/bin/nrniv
DIV=2
TMP=tmp.txt
#FILENAME=../hoc/spl/Swc_BN_1056_div1.spl

mpiexec -n 1 $NRN -mpi -NSTACK 20000 -NFRAME 1000 -c split=$DIV -c model=5 -c PRINT_NODE=0 init.hoc
#cat $TMP | grep EXIST > $FILENAME
#cat $TMP | grep MSPLIT >> $FILENAME
