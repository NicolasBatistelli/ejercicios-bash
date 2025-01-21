#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 nombre_del_servicio"
    exit 1
fi

SERVICIO="$1"

if systemctl is-active --quiet "$SERVICIO"; then
    echo "$SERVICIO está activo."
else
    echo "$SERVICIO no está activo. Reiniciando..."
    if systemctl restart "$SERVICIO"; then
        echo "$SERVICIO ha sido reiniciado con éxito."
    else
        echo "Error al reiniciar $SERVICIO."
    fi
fi

