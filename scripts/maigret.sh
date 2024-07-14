#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <nombre_usuario> [opciones]"
    echo "Opciones: "
    echo "  -o, --output <directorio>    Especificar directorio de salida"
    exit 1
fi

OUTPUT="resultado_maigret"
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--output) OUTPUT="$2"; shift ;;
        *) USERNAME="$1" ;;
    esac
    shift
done

echo "Buscando perfiles en línea para $USERNAME"
cd /opt/maigret
python3 maigret.py $USERNAME --output $OUTPUT

echo "Búsqueda completada. Resultados guardados en $OUTPUT"
