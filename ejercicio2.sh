#!/bin/bash

# Configuración
THRESHOLD=80
EMAIL="nicolas.batistelli@eldars.com.ar"

while true; do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    
    if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
        echo "Alerta: El uso de CPU ha superado el ${THRESHOLD}% (actual: ${CPU_USAGE}%)" | mail -s "Alerta de Uso de CPU" "$EMAIL"
    fi
    
    sleep 5
done

