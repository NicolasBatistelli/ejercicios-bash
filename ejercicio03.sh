#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso la ruta: $0"
    exit 1
fi

DIRECTORIO="$1"

if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: El directorio '$DIRECTORIO' no existe."
    exit 1
fi

for archivo in "$DIRECTORIO"/*; do
    if [[ -f "$archivo" ]]; then
        sed -i 's/warning/warning/g' "$archivo"
        echo "Reemplazado en: $archivo"
    fi
done


