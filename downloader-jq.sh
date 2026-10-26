```bash
#!/bin/bash

echo
echo "----DOWNLOADER----"
echo

if ! command -v jq >/dev/null 2>&1; then
    echo "Error: jq is not installed."
    echo "Install it with: sudo apt install jq"
    exit 1
fi

read -rp "Do you wish to install Termnote? Double-check the URL! (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Continuing..."

    URL=$(curl -fsSL \
        https://api.github.com/repos/L14M30/Termnote/releases/tags/Latest |
        jq -r '.assets[] | select(.name | endswith("linux.sh")) | .browser_download_url' |
        head -n 1)

    if [[ -z "$URL" ]]; then
        echo "Error: Could not find the Linux release."
        exit 1
    fi

    curl -fsSL "$URL" | bash

else
    echo "Cancelled."
fi
```
