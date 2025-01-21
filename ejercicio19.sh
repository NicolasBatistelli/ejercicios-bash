#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio_logs> <directorio_respaldo>"
  exit 1
fi

directorio_logs="$1"
directorio_respaldo="$2"
fecha=$(date +'%Y%m%d%H%M%S')

if [ ! -d "$directorio_logs" ]; then
  echo "El directorio de logs no existe: $directorio_logs"
  exit 2
fi

if [ ! -d "$directorio_respaldo" ]; then
  echo "El directorio de respaldo no existe: $directorio_respaldo"
  exit 3
fi

# Mover y comprimir los logs viejos al directorio de respaldo
for log in "$directorio_logs"/*.log; do
  if [ -f "$log" ]; then
    # Crear un nombre de archivo único con fecha
    nombre_respaldo="$directorio_respaldo/$(basename "$log")_$fecha.gz"
    
    # Comprimir el archivo de log y moverlo al directorio de respaldo
    gzip -c "$log" > "$nombre_respaldo" && rm "$log"
    
    if [ $? -eq 0 ]; then
      echo "Log comprimido y movido a respaldo: $log -> $nombre_respaldo"
    else
      echo "Error al comprimir o mover el log: $log"
    fi
  fi
done

echo "Rotación de logs completada."

