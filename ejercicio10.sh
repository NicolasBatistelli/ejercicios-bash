#!/bin/bash

# Verificar si se recibió el nombre del repositorio y el directorio de despliegue
if [ $# -ne 2 ]; then
    echo "Uso: $0 <URL_DEL_REPOSITORIO> <DIRECTORIO_DE_DESPLIEGUE>"
    exit 1
fi

REPO_URL=$1
DEPLOY_DIR=$2

# Paso 1: Verificar si Git y Docker están instalados
if ! command -v git &> /dev/null; then
    echo "Error: Git no está instalado. Por favor, instálalo y vuelve a intentarlo."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "Error: Docker no está instalado. Por favor, instálalo y vuelve a intentarlo."
    exit 1
fi

# Paso 2: Crear el directorio de despliegue si no existe
if [ ! -d "$DEPLOY_DIR" ]; then
    echo "Creando el directorio de despliegue: $DEPLOY_DIR"
    mkdir -p "$DEPLOY_DIR"
fi

# Paso 3: Clonar o actualizar el repositorio
if [ -d "$DEPLOY_DIR/.git" ]; then
    echo "Repositorio ya clonado. Actualizando..."
    cd "$DEPLOY_DIR" && git pull origin main
else
    echo "Clonando el repositorio en $DEPLOY_DIR..."
    git clone "$REPO_URL" "$DEPLOY_DIR"
fi

# Paso 4: Verificar si existe un Dockerfile
if [ ! -f "$DEPLOY_DIR/Dockerfile" ]; then
    echo "Error: No se encontró un Dockerfile en el repositorio. Asegúrate de que exista para continuar."
    exit 1
fi

# Paso 5: Construir la imagen de Docker
echo "Construyendo la imagen de Docker..."
DOCKER_IMAGE_NAME="mi_proyecto:latest"
docker build -t "$DOCKER_IMAGE_NAME" "$DEPLOY_DIR"

# Paso 6: Ejecutar el contenedor de Docker
echo "Ejecutando el contenedor de Docker..."
CONTAINER_NAME="mi_proyecto_contenedor"
if docker ps -a --format '{{.Names}}' | grep -Eq "^$CONTAINER_NAME\$"; then
    echo "El contenedor ya existe. Reiniciándolo..."
    docker stop "$CONTAINER_NAME" && docker rm "$CONTAINER_NAME"
fi

docker run -d --name "$CONTAINER_NAME" -p 8080:80 "$DOCKER_IMAGE_NAME"

echo "Despliegue completado con éxito. El contenedor está corriendo en el puerto 8080."
