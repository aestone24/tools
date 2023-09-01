#!/bin/bash

whois $1 | less
echo

ip=$(ping -c1 $1 | grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | cut -d '(' -f2 | cut -d ')' -f1)
echo $ip
echo

whois $ip | less
echo

theHarvester -d $1 -b all > tmp
grep -x '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' tmp | sort -u
echo

grep '@'$1 tmp | tr ['A-Z'] ['a-z'] | sort -u
echo




for var in 'xls+OR+filetype%3Axlsx' 'doc+OR+filetype%3Adocx' 'ppt+OR+filetype%3Apptx' 'pdf' 'txt'; do
	xdg-open https://www.google.com/search?q=site%3A$1+filetype%3A$var &
	#sleep to avoid being flagged by google
	sleep 4
done

xdg-open https://www.google.com/search?q=site:pastebin.com+%22$1%22+password &

sleep 4

xdg-open https://www.google.com/search?q=site:$1+%22confidential%22+OR+%22proprietary%22+OR+%22internal%20use%20only%22 &

sleep 4

xdg-open https://www.google.com/search?q=site:$1+filetype%3Aphp &

sleep 4

xdg-open https://www.google.com/search?q=site:$1+inurl%3A%22%2Fadmin%22

