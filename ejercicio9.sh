#!/bin/bash

DESTINATARIO="nicolas.batistelli@eldars.com.ar"
ASUNTO="Alerta de uso de disco"

UMBRAL=90

uso_disco=$(df -h --output=target,pcent | tail -n +2)


alerta=0
mensaje_alerta=""

while read -r linea; do
    particion=$(echo "$linea" | awk '{print $1}')
    porcentaje=$(echo "$linea" | awk '{print $2}' | tr -d '%')

    if [ "$porcentaje" -gt "$UMBRAL" ]; then
        mensaje_alerta+="Alerta: La partición $particion está al $porcentaje% de uso.\n"
        alerta=1
    fi
done <<< "$uso_disco"

if [ $alerta -eq 1 ]; then
    echo -e "$mensaje_alerta" | mail -s "$ASUNTO" "$DESTINATARIO"
    echo "Se ha enviado un correo de alerta a $DESTINATARIO."
else
    echo "Todas las particiones están por debajo del $UMBRAL% de uso."
fi

