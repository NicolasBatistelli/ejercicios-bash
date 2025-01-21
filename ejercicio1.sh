#!/bin/bash

for file in *.txt; do
    if [ -e "$file" ]; then
        mv -- "$file" "${file%.txt}.bak"
        echo "Renombrado: $file a ${file%.txt}.bak"
    else
        echo "No se encontraron archivos .txt."
        break
    fi
done

