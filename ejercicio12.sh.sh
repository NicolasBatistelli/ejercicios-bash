#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0"
    exit 1
fi

ARCHIVO_USUARIOS="$1"

if [ ! -f "$ARCHIVO_USUARIOS" ]; then
    echo "Error: El archivo '$ARCHIVO_USUARIOS' no existe."
    exit 1
fi

while IFS= read -r usuario; do
    if id "$usuario" &>/dev/null; then
        echo "El usuario '$usuario' ya existe."
    else
        useradd "$usuario"
        if [ $? -eq 0 ]; then
            echo "Usuario '$usuario' creado exitosamente."
        else
            echo "Error al crear el usuario '$usuario'."
        fi
    fi
done < "$ARCHIVO_USUARIOS"

