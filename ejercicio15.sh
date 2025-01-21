#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 /ruta/al/archivo_de_hosts.txt /ruta/al/archivo_de_log.log"
    exit 1
fi

ARCHIVO_HOSTS="$1"
ARCHIVO_LOG="$2"

if [ ! -f "$ARCHIVO_HOSTS" ]; then
    echo "Error: El archivo '$ARCHIVO_HOSTS' no existe."
    exit 1
fi

# Limpiar el archivo de log antes de comenzar
> "$ARCHIVO_LOG"

while IFS= read -r host; do
    echo "Pinging $host..." >> "$ARCHIVO_LOG"
    if ping -c 4 "$host" &>> "$ARCHIVO_LOG"; then
        echo "$host está accesible." >> "$ARCHIVO_LOG"
    else
        echo "$host no está accesible." >> "$ARCHIVO_LOG"
    fi
    echo "----------------------------------" >> "$ARCHIVO_LOG"
done < "$ARCHIVO_HOSTS"

echo "Ping completado. Resultados guardados en '$ARCHIVO_LOG'."

