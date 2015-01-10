#!/bin/sh

#mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=1006 init.hoc 2>&1 | tee log_result_BN_$c.1.0
mpiexec -np 2 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=2 -c model=4 -c CELL_NO=1056 -c PRINT_NODE=0 init.hoc 

