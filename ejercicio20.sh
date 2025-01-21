#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio_1> <directorio_2>"
  exit 1
fi

directorio_1="$1"
directorio_2="$2"

if [ ! -d "$directorio_1" ]; then
  echo "El directorio $directorio_1 no existe."
  exit 2
fi

if [ ! -d "$directorio_2" ]; then
  echo "El directorio $directorio_2 no existe."
  exit 3
fi

echo "Archivos presentes en $directorio_1 pero no en $directorio_2:"
comm -23 <(ls "$directorio_1" | sort) <(ls "$directorio_2" | sort)

echo "Archivos presentes en $directorio_2 pero no en $directorio_1:"
comm -13 <(ls "$directorio_1" | sort) <(ls "$directorio_2" | sort)

