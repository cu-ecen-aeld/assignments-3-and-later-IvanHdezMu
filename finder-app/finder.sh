#!/bin/bash

# Asignar los argumentos de entrada a variables
filesdir=$1
searchstr=$2

# Verificar si ambos argumentos fueron proporcionados
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Se requieren dos argumentos: un directorio y una cadena de búsqueda."
    exit 1
fi

# Verificar si el primer argumento es un directorio
if [ ! -d "$filesdir" ]; then
    echo "Error: El directorio especificado no existe."
    exit 1
fi

# Buscar archivos y cuenta líneas coincidentes
file_count=0
line_count=0

# Encuentrar y procesar cada archivo en el directorio y subdirectorios
while IFS= read -r file; do
    file_count=$((file_count + 1)) # Incrementa el contador de archivos
    # Contar las líneas que coinciden con la cadena de búsqueda en el archivo actual
    lc=$(grep -c "$searchstr" "$file")
    line_count=$((line_count + lc)) # Sumar al contador total de líneas
done < <(find "$filesdir" -type f)

# Imprimir el resultado
echo "The number of files are $file_count  and the number of matching lines are $line_count"

