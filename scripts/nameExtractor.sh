#!/bin/bash

if [ $# -le 2 ]; then
	echo "Please enter one or more files"
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

" > exnamesoutput.txt

for file in "${@:2}"
do
	while IFS= read -r line
	do
		grep $1 "$line" >> exnamesoutput.txt
	done < "$file"
done

sort -u exnamesoutput.txt
