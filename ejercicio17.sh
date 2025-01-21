#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio_origen> <directorio_destino>"
  exit 1
fi

origen="$1"
destino="$2"

if [ ! -d "$origen" ]; then
  echo "El directorio origen no existe: $origen"
  exit 2
fi

if [ ! -d "$destino" ]; then
  echo "El directorio destino no existe: $destino"
  exit 3
fi

# Comando rsync para realizar el backup incremental
rsync -avh --delete --link-dest="$destino/last_backup" "$origen/" "$destino/current_backup/"

if [ $? -eq 0 ]; then
  echo "Backup incremental completado con éxito."
  # Crear un enlace simbólico para apuntar al último backup
  rm -f "$destino/last_backup"
  ln -s "$destino/current_backup" "$destino/last_backup"
else
  echo "Hubo un error al realizar el backup."
  exit 4
fi

