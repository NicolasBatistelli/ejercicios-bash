#!/bin/bash

DIRECTORIO="/var/log"
UMBRAL=$((100 * 1024 * 1024))

if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: El directorio '$DIRECTORIO' no existe."
    exit 1
fi

for archivo in "$DIRECTORIO"/*; do
    if [ -f "$archivo" ]; then
        TAMANHO=$(stat -c%s "$archivo")
        if [ "$TAMANHO" -gt "$UMBRAL" ]; then
            echo "Comprimiendo: $archivo"
            tar -czf "$archivo.tar.gz" "$archivo" && rm "$archivo"
        fi
    fi
done

echo "Compresión completa."

