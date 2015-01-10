#!/bin/sh

#mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=1006 init.hoc 2>&1 | tee log_result_BN_$c.1.0
mpiexec -np 1 ./x86_64/special -mpi -NSTACK 20000 -NFRAME 1000 -c split=1 -c model=4 -c CELL_NO=1056 -c PRINT_NODE=0 init.hoc # | grep SWC > tmp.txt

#mpiexec -np 1 nrniv -mpi -NSTACK 20000 -NFRAME 1000 -c split=4 -c model=4 -c CELL_NO=1056 init.hoc 2>&1 | tee log_result_BN_1056.1.0

#for c in 1006 1056 662 692
#do
#	mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=$c init.hoc 2>&1 | tee log_result_BN_$c.1.0
#			mpiexec -np $i nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=$j -c "model=4" -c CELL_NO=$c init.hoc 2>&1 | tee log_result_BN_$c.$i.$j
#			cat log_result_BN_$c.$i.$j | grep "#" >> result_BN_$c.txt
#		done
#	done
#done
#
#for c in 1062 969 970
#do
#	mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=$c init.hoc 2>&1 | tee log_result_UN_$c.1.0
#	cat log_result_UN_$c.1.0 | grep "#" >> result_UN_$c.txt
#	for i in 2 3 4
#	do
#		for j in 2
#		do 
#			if [i < j]
#			then
#				continue
#			fi
#			mpiexec -np $i nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=$j -c "model=4" -c CELL_NO=$c init.hoc 2>&1 | tee log_result_UN_$c.$i.$j
#			cat log_result_UN_$c.$i.$j | grep "#" >> result_UN_$c.txt
#		done
#	done
#done
