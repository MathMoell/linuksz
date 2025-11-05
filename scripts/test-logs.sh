#!/bin/bash
# Testskript: saadab iga 5s uue logirea
counter=1
while true; do
    logger "Testlogi #$counter: $(date)"
    echo "Saadetud: #$counter"
    counter=$((counter + 1))
    sleep 5
done
