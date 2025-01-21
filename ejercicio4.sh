#!/bin/bash

# Función para validar dirección IP
validar_ip() {
    local ip="$1"

    # Validación de IPv4
    if [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        IFS='.' read -r i1 i2 i3 i4 <<< "$ip"
        if (( i1 >= 0 && i1 <= 255 && i2 >= 0 && i2 <= 255 && i3 >= 0 && i3 <= 255 && i4 >= 0 && i4 <= 255 )); then
            echo "$ip es una dirección IPv4 válida."
            return
        fi
    fi

# Validación de IPv6
    if [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,7}:$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}$ ]] ||
       [[ "$ip" =~ ^([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}$ ]] ||
       [[ "$ip" =~ ^[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6}|:)$ ]] ||
       [[ "$ip" =~ ^:((:[0-9a-fA-F]{1,4}){1,7}|:)$ ]] ||
       [[ "$ip" =~ ^fe80::([0-9a-fA-F]{0,4}:){0,4}[0-9a-fA-F]{1,4}$ ]] ||
       [[ "$ip" =~ ^::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4][0-9]|[01]?[0-9][0-9]?)\.)(25[0-5]|(2[0-4][0-9]|[01]?[0-9][0-9]?))\.)(25[0-5]|(2[0-4][0-9]|[01]?[0-9][0-9]?)\.)(25[0-5]|(2[0-4][0-9]|[01]?[0-9][0-9]?))$ ]]; then
        echo "$ip es una dirección IPv6 válida."
        return
    fi

    echo "$ip no es una dirección IP válida."
}

# Leer la dirección IP desde la entrada del usuario
read -p "Ingrese una dirección IP: " direccion_ip
validar_ip "$direccion_ip"

