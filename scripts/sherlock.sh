#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_usuario> [opciones]"
    echo "Opciones: "
    echo "  -o, --output <archivo>    Especificar archivo de salida"
    exit 1
fi

OUTPUT="resultado_sherlock.txt"
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--output) OUTPUT="$2"; shift ;;
        *) USERNAME="$1" ;;
    esac
    shift
done

echo "Buscando perfiles de redes sociales para $USERNAME"
cd /opt/sherlock
python3 sherlock.py $USERNAME --output $OUTPUT

echo "Búsqueda completada. Resultados guardados en $OUTPUT"
