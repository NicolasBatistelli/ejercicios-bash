#!/bin/bash

if [ -z "$1" ]; then
  echo "Por favor, proporciona el nombre de un archivo."
  exit 1
fi

archivo="$1"

if [ -e "$archivo" ]; then
  echo "El archivo '$archivo' existe."
else
  echo "El archivo '$archivo' no existe."
fi

