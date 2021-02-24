#!/usr/bin/bash
echo -e "\nPeptide Parameters Generator Version 2.0"
echo -e "-----Created by Maruf Ahmed Bhuiyan-----\n"
echo "This script reports the number of aromatic, polar"
echo -e "non-polar, acidic & basic residues for peptide sequences\n"

set -eu
sleep 2

i=0

while IFS="\n" read p; do
	aromatic=$(echo $p | tr -cd "F|Y|W" | wc -c)
	positive=$(echo $p | tr -cd "K|R|H" | wc -c)
	negative=$(echo $p | tr -cd "D|E" | wc -c)
	polar=$(echo $p | tr -cd "G|A|P|V|L|I|M" | wc -c)
	nonpolar=$(echo $p | tr -cd "S|T|C|N|Q" | wc -c)
	total=$((aromatic+polar+nonpolar+positive+negative))

	if [[ $i -eq 0 ]]; then
		echo -e "Sequence\tLength\tAromatic\tNegatively Charged\tPositively Charged\tPolar\tNon-polar"
		((i=i+1))
	fi

	echo -e "$p\t$total\t$aromatic\t$negative\t$positive\t$polar\t$nonpolar"

done < "$1" | tee -a peptide_param.tsv
