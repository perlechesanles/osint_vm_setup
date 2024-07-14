# OSINT VM Setup

Este repositorio contiene scripts y manuales para configurar una máquina virtual centrada en herramientas de OSINT (Open Source Intelligence).

## Instrucciones de Uso

### Paso 1: Clonar el Repositorio

```bash
git clone https://github.com/tu_usuario/osint_vm_setup.git
cd osint_vm_setup
```
### Paso 2: Ejecutar el Script de Configuración
```bash
chmod +x setup_osint.sh
sudo ./setup_osint.sh
```

Este script actualizará el sistema, instalará las herramientas necesarias y configurará el entorno.

### Paso 3: Utilizar los Scripts de Herramientas

Los scripts para cada herramienta se encuentran en el directorio scripts/. Asegúrate de darles permisos de ejecución:
```bash
chmod +x scripts/*.sh
```

Ejecuta los scripts según tus necesidades. Por ejemplo, para buscar perfiles con Sherlock:

```bash
bash scripts/sherlock.sh <nombre_usuario>
```
Manuales

Los manuales para cada herramienta se encuentran en el directorio man/. Puedes verlos con el comando man:

```bash
man ./man/sherlock.1
```
Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir cualquier cambio que quieras realizar.

