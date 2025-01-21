# Ejercicios de Bash

Este repositorio contiene una serie de ejercicios prácticos diseñados para mejorar tus habilidades en Bash scripting. Cada ejercicio aborda problemas comunes relacionados con la administración de sistemas, automatización y manejo de archivos.

---

## 📋 Lista de Ejercicios

1. **Renombrar Archivos Masivamente**  
   Renombra todos los archivos `.txt` de un directorio cambiando su extensión a `.bak`.

2. **Monitorear Uso de CPU**  
   Crea un script que monitoree el uso de CPU cada 5 segundos y envíe una alerta por correo si el uso supera el 80%.

3. **Buscar y Reemplazar Texto**  
   Escribe un script que reemplace todas las ocurrencias de la palabra "error" por "warning" en los archivos de un directorio.

4. **Validar una Dirección IP**  
   Desarrolla un script que valide si una cadena ingresada es una dirección IP válida.

5. **Copia de Seguridad Automática**  
   Crea un script que realice una copia de seguridad de los archivos de un directorio a otro, agregando la fecha actual al nombre del archivo comprimido.

6. **Comprimir Archivos Grandes**  
   Escribe un script que encuentre archivos de más de 100MB en el directorio `/var/log` y los comprima.

7. **Control de Servicio**  
   Crea un script que revise si un servicio (por ejemplo, `nginx`) está activo y lo reinicie si no lo está.

8. **Crear y Enlazar Directorios**  
   Escribe un script que cree un directorio llamado `deploy` y enlace simbólicamente los archivos de otro directorio.

9. **Analizar Uso de Disco**  
   Crea un script que informe el uso de disco de todas las particiones y envíe una alerta si alguna partición supera el 90% de uso.

10. **Automatizar Deploy de un Repositorio Git**  
    Escribe un script que haga un pull del repositorio Git, construya el proyecto y lo despliegue en un servidor.

11. **Automatización de Tareas Cron**  
    Crea un script que agregue una tarea a `cron` para realizar copias de seguridad diarias a las 2 a.m.

12. **Crear Usuarios en Masa**  
    Escribe un script que lea un archivo de texto con nombres de usuarios y cree esos usuarios en el sistema.

13. **Procesamiento de Logs**  
    Crea un script que procese los archivos de logs de Apache y cuente cuántas veces cada IP ha accedido al servidor.

14. **Verificar el Estado de los Puertos**  
    Escribe un script que revise si un puerto específico (por ejemplo, el puerto 80) está en uso.

15. **Ping a Múltiples Hosts**  
    Desarrolla un script que haga ping a una lista de hosts y guarde los resultados en un archivo de log.

16. **Procesar Argumentos en un Script**  
    Escribe un script que acepte un nombre de archivo como argumento y muestre si el archivo existe o no.

17. **Backup Incremental**  
    Crea un script que realice un backup incremental usando `rsync` desde una carpeta origen a una de destino.

18. **Borrar Archivos Antiguos**  
    Escribe un script que borre archivos de más de 30 días de antigüedad en un directorio específico.

19. **Rotación de Logs**  
    Crea un script para rotar los archivos de log. Los logs viejos deben ser comprimidos y movidos a un directorio de respaldo.

20. **Comparar Dos Directorios**  
    Escribe un script que compare dos directorios y muestre los archivos que están presentes en uno pero no en el otro.

---

## 🛠 Requisitos Previos

- Un sistema basado en Unix con Bash instalado.
- Conocimientos básicos de scripting en shell y permisos de archivo.
- Herramientas como `rsync`, `cron` y `mail` para algunos ejercicios.

---

## 🚀 Cómo Usar

1. Clona este repositorio:  
   ```bash
   git clone https://github.com/NicolasBatistelli/ejercicios-bash.git
   cd ejercicios-bash
