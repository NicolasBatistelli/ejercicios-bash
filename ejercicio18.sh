#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

directorio="$1"

if [ ! -d "$directorio" ]; then
  echo "El directorio no existe: $directorio"
  exit 2
fi

# Eliminar los archivos que tienen más de 30 días de antigüedaid
find "$directorio" -type f -mtime +30 -exec rm -v {} \;

if [ $? -eq 0 ]; then
  echo "Archivos con más de 30 días de antigüedad han sido eliminados con éxito."
else
  echo "Hubo un error al eliminar los archivos."
  exit 3
fi

