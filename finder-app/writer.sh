#!/bin/bash

# Asigna los argumentos de entrada a variables
writefile=$1
writestr=$2

# Verifica si ambos argumentos fueron proporcionados
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Se requieren dos argumentos, una ruta de archivo y una cadena de texto."
    exit 1
fi

# Intenta crear los directorios si no existen
dir_path=$(dirname "$writefile")
mkdir -p "$dir_path"

# Verifica si el directorio se creó correctamente
if [ ! -d "$dir_path" ]; then
    echo "Error: No se pudo crear el directorio para el archivo."
    exit 1
fi

# Intenta escribir la cadena en el archivo, creando o sobrescribiendo el archivo
echo "$writestr" > "$writefile"

# Verifica si el archivo se creó y escribió correctamente
if [ $? -ne 0 ]; then
    echo "Error: No se pudo escribir en el archivo."
    exit 1
fi

echo "Archivo creado y escrito exitosamente."
