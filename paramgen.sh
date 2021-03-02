#!/usr/bin/bash

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

if [[ -z $1 ]]
then
	echo "You did not provide any file"
	echo -e "\nUsage: "${0}" <file_name> "
	exit 1
fi

if [[ ! -f $1 ]] 
then
	echo "File "$1" doesn't exist"
	exit 1
fi

if [[ -f peptide_parameters.tsv ]]
then
	echo -e "\npeptide_parameters.tsv file already exists. "
	read -p "Do you want to append to the file? (y/n) " ANS
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

done < "$1" | tee -a peptide_parameters.tsv

info_end() {
echo -e "\nScript successfully executed"
echo -e "\nPeptide parameters were generated in peptide_parameters.tsv file in the current folder"
}

info
info_end
