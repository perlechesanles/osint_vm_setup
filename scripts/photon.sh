#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <URL> [opciones]"
    echo "Opciones: "
    echo "  -o, --output <directorio>    Especificar directorio de salida"
    exit 1
fi

OUTPUT="resultado_photon"
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--output) OUTPUT="$2"; shift ;;
        *) URL="$1" ;;
    esac
    shift
done

echo "Recolectando información de $URL con Photon"
cd /opt/photon
python3 photon.py -u $URL -o $OUTPUT

echo "Recolección completada. Resultados guardados en $OUTPUT"
