#! /usr/bin/bash

# Oh my posh!
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh

# Move around the shared resources
ln -s ../shared/bfischer.omp.json ~/.poshthemes/bfischer.omp.json

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Need to automate accepting default.s

# Personal computer usage python (need to make so this doesn't happen on servers.)
ln -sf /usr/bin/python3 /usr/bin/python
apt install ansible nmap python3-venv python3-pip yarn npm

# Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
ansible-galaxy install geerlingguy.postgresql robertdebock.rpmfusion
ansible-galaxy collection install community.general

# Azure
#Universe package is pretty outdated, use MS official instead
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
apt-get update
apt-get install azure-cli