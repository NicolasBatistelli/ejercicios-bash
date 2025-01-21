#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 /ruta/al/archivo_de_log_apache.log"
    exit 1
fi

ARCHIVO_LOG="$1"

if [ ! -f "$ARCHIVO_LOG" ]; then
    echo "Error: El archivo '$ARCHIVO_LOG' no existe."
    exit 1
fi

echo "Contando accesos por IP..."
awk '{print $1}' "$ARCHIVO_LOG" | sort | uniq -c | sort -nr > conteo_ips.txt

echo "Conteo de accesos por IP:"
cat conteo_ips.txt
