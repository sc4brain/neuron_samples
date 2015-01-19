rm num_cmp*.txt

for i in {0..7}
do
    grep ", ${i}" split8.txt | wc -l >> num_cmp8.txt
done


for i in {0..15}
do
    grep ", ${i}" split16.txt | wc -l >> num_cmp16.txt
done

for i in {0..31}
do
    grep ", ${i}" split32.txt | wc -l >> num_cmp32.txt
done

for i in {0..63}
do
    grep ", ${i}" split64.txt | wc -l >> num_cmp64.txt
done

for i in {0..127}
do
    grep ", ${i}" split128.txt | wc -l >> num_cmp128.txt
done
