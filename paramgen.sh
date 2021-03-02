#!/usr/bin/env bash

info() {
echo -e "\nPeptide Parameters Generator Version 2.0"
echo -e "-----Created by Maruf Ahmed Bhuiyan-----\n"
echo "This script reports the number of aromatic, polar"
echo "non-polar, acidic & basic residues for peptide sequences"
}

# Stop executing the script if nonzero exit status
# Stop executing the script if any pipe exits wtih nonzero exit status
set -eo pipefail

i=0

# Check whether the user provided any file as input
if [[ -z $1 ]]
then
	echo "You did not provide any file"
	echo -e "\nUsage: "${0}" <file_name> "
	exit 1
fi

# Check whether the file exists
if [[ ! -f $1 ]] 
then
	echo "File "$1" doesn't exist"
	exit 1
fi

# Check whether the file output file already exists.
# Based on the input append to the existing file or terminate the script
if [[ -f peptide_parameters.tsv ]]
then
	echo -e "\npeptide_parameters.tsv file already exists. "
	read -p "Do you want to append to the existing file? (y/n) " ANS
	case $ANS in 
		y|Y|[yY][eE][sS])
			echo "File will be appended." 
			;;
		
		n|N|[nN][oO])
			echo "Terminating script..."
			exit 0 
			;;
		
		*)
			echo "Invalid argument. " 
			echo "Terminating script..."
			exit 1
			;;
	esac
fi

# read the peptide file line by line 
# and for each line count the number of aromatic, positive, negative, polar, nonpolar residues
# and total length of the peptide sequence
# finally, generate a tab separated value (tsv) file 
while IFS="\n" read p; do
	# count the aromatic residues such as Phenylalanine(F), Tyrosine(Y) or Tryptophan(W)
	aromatic=$(echo $p | tr -cd "F|Y|W" | wc -c)
	
	# count the positively charged residues such as Lysine(K), Arginine(R), Histidine(H)
	positive=$(echo $p | tr -cd "K|R|H" | wc -c)
	
	# count the negatively charged resides such as Aspartic acid(D) or Glutamic acid(E)
	negative=$(echo $p | tr -cd "D|E" | wc -c)
	
	# count the polar residues such as Glycine(G), Alanine(A), Proline(P), Valine(V), Leucine(L)
	# Isoleucine(I), Methionine(M)
	polar=$(echo $p | tr -cd "G|A|P|V|L|I|M" | wc -c)
	
	# count the number of nonpolar residues such as Serine(S), Threonine(T), Cysteine(C), Asparagine(N), Glutamine(Q)
	nonpolar=$(echo $p | tr -cd "S|T|C|N|Q" | wc -c)
	
	# count the length of the peptide sequence
	total=$((aromatic+polar+nonpolar+positive+negative))
	
	# print all the residue count in tab separated file
	if [[ $i -eq 0 ]]; then
		echo -e "Sequence\tLength\tAromatic\tNegatively Charged\tPositively Charged\tPolar\tNon-polar"
		((i=i+1))
	fi

	echo -e "$p\t$total\t$aromatic\t$negative\t$positive\t$polar\t$nonpolar"	

done < "$1" | tee -a peptide_parameters.tsv

info_end() {
echo -e "\nScript successfully executed"
echo -e "\nPeptide parameters were generated in peptide_parameters.tsv file in the current folder"
}

info
info_end
