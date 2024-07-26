#!/bin/bash

if [ $# -le 1 ]; then
	echo "Please enter one input file and one or more wordlist files"
	echo "Example: ./exNames.sh <file_to_search> <wordlist1> <wordlist2>"
	exit 1
fi

for file in "$@"
do
	if [ ! -f "$file" ]; then
		echo "Error: '$file' is not a file"
		exit 1
	fi
done

echo "Extracted Names

" > temporaryexnamesfile

for file in "${@:2}"
do
	while IFS= read -r line
	do
		grep "$line" "$1" >> temporaryexnamesfile
	done < "$file"
done

sort -u temporaryexnamesfile > exnamesoutput.txt
rm temporaryexnamesfile
