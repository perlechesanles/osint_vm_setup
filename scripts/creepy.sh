#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <nombre_usuario>"
    exit 1
fi

echo "Recolectando información de geolocalización para $1 con Creepy"
creepy --search $1 --output resultado_creepy.json

echo "Recolección completada. Resultados guardados en resultado_creepy.json"
