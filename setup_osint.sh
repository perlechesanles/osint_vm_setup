#!/bin/bash

# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Instalar herramientas básicas
sudo apt install -y maltego recon-ng theharvester spiderfoot curl jq \
                    golang python3 python3-pip creepy geoip-bin \
                    elasticsearch kibana logstash misp \
                    sublime-text ivre eyewitness urlcrazy knockpy shodan-cli \
                    recon-ng ghunt exiftool docker.io docker-compose

# Instalar herramientas desde repositorios específicos
git clone https://github.com/laramies/metagoofil.git /opt/metagoofil
git clone https://github.com/sherlock-project/sherlock.git /opt/sherlock
git clone https://github.com/twintproject/twint.git /opt/twint
git clone https://github.com/opsdisk/metagoofil.git /opt/metagoofil
git clone https://github.com/soxoj/maigret.git /opt/maigret
git clone https://github.com/smicallef/spiderfoot.git /opt/spiderfoot
git clone https://github.com/WebBreacher/WhatsMyName.git /opt/whatsmyname
git clone https://github.com/s0md3v/Photon.git /opt/photon
git clone https://github.com/datasploit/datasploit.git /opt/datasploit
git clone https://github.com/OWASP/Amass.git /opt/amass
git clone https://github.com/s0md3v/ReconDog.git /opt/recondog
git clone https://github.com/mxrch/GHunt.git /opt/ghunt
git clone https://github.com/JesusNieto/FOCA.git /opt/foca
git clone https://github.com/jofpin/trape.git /opt/trape
git clone https://github.com/laramies/theHarvester.git /opt/theharvester
git clone https://github.com/lockfale/osint-framework.git /opt/osint-framework

# Instalar dependencias para las herramientas
pip3 install -r /opt/metagoofil/requirements.txt
pip3 install -r /opt/sherlock/requirements.txt
pip3 install -r /opt/twint/requirements.txt
pip3 install -r /opt/maigret/requirements.txt
pip3 install -r /opt/spiderfoot/requirements.txt
pip3 install -r /opt/whatsmyname/requirements.txt
pip3 install -r /opt/photon/requirements.txt
pip3 install -r /opt/datasploit/requirements.txt
pip3 install -r /opt/ghunt/requirements.txt
pip3 install -r /opt/trape/requirements.txt
pip3 install -r /opt/theharvester/requirements.txt

# Configurar Docker y Portainer
sudo systemctl start docker
sudo systemctl enable docker
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 -p 8000:8000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# Configurar ufw
sudo apt install -y ufw
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Configurar Git
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"

# Configurar ambiente Python virtual
pip3 install virtualenv
virtualenv ~/osint_env

# Crear alias útiles
echo 'alias osintenv="source ~/osint_env/bin/activate"' >> ~/.bashrc
echo 'alias actualizar="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
echo 'alias buscar_perfiles="bash /opt/sherlock/sherlock.sh"' >> ~/.bashrc
echo 'alias recolectar_twitter="bash /opt/twint/twint.sh"' >> ~/.bashrc
echo 'alias recolectar_maigret="bash /opt/maigret/maigret.sh"' >> ~/.bashrc
echo 'alias recolectar_photon="bash /opt/photon/photon.sh"' >> ~/.bashrc
echo 'alias recolectar_creepy="bash /opt/creepy/creepy.sh"' >> ~/.bashrc

# Configurar tareas cron
(crontab -l ; echo "0 2 * * 7 sudo apt update && sudo apt upgrade -y") | crontab -

echo "Instalación y configuración completada."
