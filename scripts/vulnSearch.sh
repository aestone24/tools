#!/bin/bash

echo
echo "Search for exploits"
echo
echo "---------------------------------------------------------"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "---------------------------------------------------------"
echo

if [ $# -ne 1 ]; then
     echo -n "Enter CVE: "
     read CVE
     echo
else
     CVE=$1
fi

shorthand="$(echo $CVE | cut -d '-' -f2)-$(echo $CVE | cut -d '-' -f3)"

xdg-open https://github.com/search?q=$CVE\&type=repositories\&s=stars\&o=desc &
sleep 1
xdg-open https://www.google.com/search?q=$CVE+exploit &
sleep 1
xdg-open https://nvd.nist.gov/vuln/search/results?form_type=Basic\&results_type=overview\&query=$CVE\&queryType=phrase\&search_type=all\&isCpeNameSearch=false &
sleep 1
xdg-open https://www.rapid7.com/db/?q=$CVE\&type= &
sleep 1
echo
echo "---------------------------------------------------------"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "---------------------------------------------------------"
echo
echo "Searchsploit Results:"
searchsploit $CVE
echo
echo "---------------------------------------------------------"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "---------------------------------------------------------"
echo
echo "Metasploit Results:"
msfconsole -x "search cve:$shorthand;exit" -q
