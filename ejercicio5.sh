#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 ruta origen | ruta destino"
    exit 1
fi

DIRECTORIO_ORIGEN="$1"
DIRECTORIO_DESTINO="$2"

if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
    echo "Error: El directorio de origen '$DIRECTORIO_ORIGEN' no existe."
    exit 1
fi

FECHA=$(date +%Y%m%d)

NOMBRE_ARCHIVO="copia_backup_$FECHA.tar.gz"

tar -czf "$DIRECTORIO_DESTINO/$NOMBRE_ARCHIVO" -C "$DIRECTORIO_ORIGEN" .

if [ $? -eq 0 ]; then
    echo "Copia de seguridad creada exitosamente: $DIRECTORIO_DESTINO/$NOMBRE_ARCHIVO"
else
    echo "Error al crear la copia de seguridad."
    exit 1
fi

