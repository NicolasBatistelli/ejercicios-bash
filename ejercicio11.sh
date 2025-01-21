#!/bin/bash

# Configuración
DIRECTORIO_ORIGEN="/home/nico/Escritorio/bash"
DIRECTORIO_DESTINO="/home/nico/Escritorio/bash/backups"
NOMBRE_TAREA="backup_diario"
COMANDO="tar -czf $DIRECTORIO_DESTINO/\$(date +\%Y-\%m-\%d).tar.gz -C $DIRECTORIO_ORIGEN ."

if crontab -l | grep -q "$NOMBRE_TAREA"; then
    echo "La tarea '$NOMBRE_TAREA' ya está programada."
else
    # Agregar la tarea a cron
    (crontab -l; echo "0 2 * * * $COMANDO # $NOMBRE_TAREA") | crontab -
    echo "Tarea de copia de seguridad programada para las 2 AM todos los días."
fi

