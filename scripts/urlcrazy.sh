#!/bin/bash

if [ -z "$1" ]; entonces
    echo "Uso: $0 <dominio>"
    exit 1
fi

echo "Generando y verificando dominios typo-squatting para $1 con URLCrazy"
urlcrazy $1 -o resultados_urlcrazy.csv

echo "Verificación completada. Resultados guardados en resultados_urlcrazy.csv"
