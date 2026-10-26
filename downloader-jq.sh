#!/bin/bash
echo " "
echo "----DOWNLOADER----"
echo "This downloader requires jq to be installed"
echo " "
read -rp "Do you wish to install? Please double check you have entered the correct URL! (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
	echo "Continuing"

curl -fsSL https://api.github.com/repos/L14M30/Termnote/releases/tags/Latest \
  | jq -r '.assets[] | select(.name | endswith("linux.sh")) | .browser_download_url' \
  | xargs -r curl -fsSL \
  | bash

else
	echo "Cancelled"
fi
