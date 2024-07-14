#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install necessary packages
sudo apt install -y exiftool ufw iptables

# Install snap packages
sudo snap install spiderfoot
sudo snap install sublime-text

# Install pip3 if not already installed
if ! command -v pip3 &> /dev/null; then
    sudo apt install -y python3-pip
fi

# Install virtualenv if not already installed
if ! command -v virtualenv &> /dev/null; then
    sudo pip3 install virtualenv
fi

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Clone repositories
repos=(
    "https://github.com/laramies/metagoofil /opt/metagoofil"
    "https://github.com/sherlock-project/sherlock /opt/sherlock"
    "https://github.com/twintproject/twint /opt/twint"
    "https://github.com/soxoj/maigret /opt/maigret"
    "https://github.com/smicallef/spiderfoot /opt/spiderfoot"
    "https://github.com/webbreacher/WhatsMyName /opt/whatsmyname"
    "https://github.com/s0md3v/Photon /opt/photon"
    "https://github.com/DataSploit/datasploit /opt/datasploit"
    "https://github.com/OWASP/Amass /opt/amass"
    "https://github.com/UltimateHackers/ReconDog /opt/recondog"
    "https://github.com/megadose/ghunt /opt/ghunt"
    "https://github.com/jofpin/trape /opt/trape"
    "https://github.com/laramies/theHarvester /opt/theharvester"
    "https://github.com/lockfale/osint-framework /opt/osint-framework"
)

for repo in "${repos[@]}"; do
    repo_url=$(echo $repo | cut -d ' ' -f 1)
    repo_dir=$(echo $repo | cut -d ' ' -f 2)
    if [ -d "$repo_dir" ]; then
        echo "Directory $repo_dir already exists, skipping clone."
    else
        git clone "$repo_url" "$repo_dir"
    fi
done

# Special handling for FOCA due to authentication
if [ ! -d "/opt/foca" ]; then
    echo "FOCA repository requires authentication. Skipping clone."
fi

# Setup firewall
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Instalación y configuración completada."
