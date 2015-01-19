
for c in 1006 1056 662 692
do
	mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=$c init.hoc 2>&1 | tee log_result_BN_$c.1.0
	cat log_result_BN_$c.1.0 | grep "#" >> result_BN_$c.txt
	for i in 2 3 4
	do
		for j in 2
		do 
			if [i < j]
			then
				continue
			fi
			mpiexec -np $i nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=$j -c "model=4" -c CELL_NO=$c init.hoc 2>&1 | tee log_result_BN_$c.$i.$j
			cat log_result_BN_$c.$i.$j | grep "#" >> result_BN_$c.txt
		done
	done
done

for c in 1062 969 970
do
	mpiexec -np 1 nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=0 -c model=4 -c CELL_NO=$c init.hoc 2>&1 | tee log_result_UN_$c.1.0
	cat log_result_UN_$c.1.0 | grep "#" >> result_UN_$c.txt
	for i in 2 3 4
	do
		for j in 2
		do 
			if [i < j]
			then
				continue
			fi
			mpiexec -np $i nrniv -mpi -NSTACK 10000 -NFRAME 200 -c split=$j -c "model=4" -c CELL_NO=$c init.hoc 2>&1 | tee log_result_UN_$c.$i.$j
			cat log_result_UN_$c.$i.$j | grep "#" >> result_UN_$c.txt
		done
	done
done
