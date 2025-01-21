#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0"
    exit 1
fi

DIRECTORIO_ORIGEN="$1"
DIRECTORIO_DESTINO="deploy"

mkdir -p "$DIRECTORIO_DESTINO"

if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
    echo "Error: El directorio de origen '$DIRECTORIO_ORIGEN' no existe."
    exit 1
fi

for archivo in "$DIRECTORIO_ORIGEN"/*; do
    if [ -f "$archivo" ]; then
        ln -s "$archivo" "$DIRECTORIO_DESTINO/"
        echo "Enlace simbólico creado para: $archivo"
    fi
done

echo "Todos los enlaces simbólicos han sido creados en el directorio '$DIRECTORIO_DESTINO'."

