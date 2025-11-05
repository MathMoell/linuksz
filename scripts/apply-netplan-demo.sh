#!/bin/bash
# Abi-skript: kopeerib demo netplan faili aktuaalseks (kasuta ainult demo VM-is)
if [ -f ./configs/00-installer-config-server.yaml ]; then
    sudo cp ./configs/00-installer-config-server.yaml /etc/netplan/00-installer-config.yaml
    echo "Server netplan applied (demo). Run sudo netplan try"
fi
if [ -f ./configs/00-installer-config-client.yaml ]; then
    echo "Client demo file present. Copy as needed."
fi
