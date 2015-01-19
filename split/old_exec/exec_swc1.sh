#!/bin/sh

mpiexec -np 2 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=2 -c model=5 -c PRINT_NODE=0 init.hoc 

