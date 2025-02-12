#!/bin/bash

cd "$(dirname "$0")"

if [[ -f repo1/ip.txt.gpg ]]; then
	rm -r repo1
fi

git clone "$1" repo1

gpg --output ip.txt --decrypt --recipient "$2" ip.txt.gpg

cat ip.txt
