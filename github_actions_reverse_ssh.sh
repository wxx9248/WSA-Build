#!/bin/bash

if [[ "$REVERSE_SSH" != "true" ]]; then
    echo "REVERSE_SSH is not true, skipping"
    exit 0
fi

pacman -S --no-confirm socat
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "$REVERSE_SSH_PUBLIC_KEY" >~/.ssh/authorized_keys
echo Current user: $(whoami)
socat tcp4-connect:$REVERSE_SSH_REMOTE_ADDRESS_PORT tcp4-connect:127.0.0.1:22
