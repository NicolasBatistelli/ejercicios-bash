#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <puerto>"
    exit 1
fi

PUERTO="$1"

if netstat -tuln | grep -q ":$PUERTO "; then
    echo "El puerto $PUERTO está en uso."
else
    echo "El puerto $PUERTO no está en uso."
fi

