#!/bin/bash
eval $(ssh-agent -s)

cd "$(dirname "$0")"


if [[ -d "$HOME"/.ipuploader ]]; then
	echo "[$(date "+%Y/%m/%d %H:%M:%S")] Directory already exists" >> ipu.log
else
	mkdir "$HOME"/.ipuploader
fi

if ping -c 1 -W 10 monip.org >/dev/null 2>&1; then
	ssh-add "$HOME"/.ssh/"$1"
	curl monip.org > "$HOME"/.ipuploader/ip.txt
	if [[ -f "$HOME"/.ipuploader/ip.txt.gpg ]]; then
		rm "$HOME"/.ipuploader/ip.txt.gpg
	fi
	gpg --encrypt --recipient "$2" "$HOME"/.ipuploader/ip.txt
	cp "$HOME"/.ipuploader/ip.txt.gpg .
	git commit -a -m "[$(date "+%Y/%m/%d %H:%M:%S")]"
	git push
	echo "[$(date "+%Y/%m/%d %H:%M:%S")] uploaded and pushed successfully" >> "$HOME"/.ipuploader/ipu.log
	
else

	echo "[$(date "+%Y/%m/%d %H:%M:%S")] There was a problem pinging monip.org" >> "$HOME"/ipu.log
fi
