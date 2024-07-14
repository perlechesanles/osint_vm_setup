#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <nombre_usuario> [opciones]"
    echo "Opciones: "
    echo "  -o, --output <archivo>    Especificar archivo de salida"
    exit 1
fi

OUTPUT="resultado_twint.csv"
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--output) OUTPUT="$2"; shift ;;
        *) USERNAME="$1" ;;
    esac
    shift
done

echo "Recolectando información de Twitter para $USERNAME"
cd /opt/twint
python3 twint -u $USERNAME -o $OUTPUT --csv

echo "Recolección completada. Resultados guardados en $OUTPUT"
