#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <URL>"
    exit 1
fi

echo "Capturando captura de pantalla de $1 con EyeWitness"
eyewitness --web -f $1 --results resultados_eyewitness

echo "Captura completada. Resultados guardados en la carpeta resultados_eyewitness"
