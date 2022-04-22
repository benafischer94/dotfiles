#! /usr/bin/bash

# Profile
echo "Spitting out our profile"
cat "$PWD/.profile" > $HOME/.profile

echo "Linking our scripts"
ln -s -f "$PWD/scripts/" $HOME/scripts

echo "Git config"
cat "$PWD/.gitconfig" > $HOME/.gitconfig

# Oh my posh!
echo "Pulling Posh!"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh >/dev/null
sudo chmod +x /usr/local/bin/oh-my-posh >/dev/null
# Need to get nerdfont setup.

# Move around the shared resources
echo "Moving around shared resources"
if ! [ -d "$HOME/.poshthemes" ] ; then
  mkdir $HOME/.poshthemes > /dev/null
fi
  ln -s -f "$PWD/../shared/bfischer.omp.json" $HOME/.poshthemes/bfischer.omp.json

# Rust
#echo "Downloading rust!"
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Need to automate accepting defaults, and some version checking

# Personal computer usage python (need to make so this doesn't happen on servers.)
echo "Makeing sure python3 is the default python"
sudo ln -sf /usr/bin/python3 /usr/bin/python

# Needful downloads
echo "Fetching Ansible, NMAP, VENV, PIP, Yarn, and NPM"
sudo apt-get install ansible nmap python3-venv python3-pip yarn npm -y >/dev/null

# GoGo Gadget Ranger! (GoVC CLI)
echo "Fetching GOVC"
mkdir /tmp/govc > /dev/null
pushd /tmp/govc
curl -L -C - https://github.com/vmware/govmomi/releases/latest/download/govc_Linux_x86_64.tar.gz --output govc.tar.gz
tar xvf ./govc.tar.gz
sudo mv govc /usr/local/bin/govc > /dev/null
popd
rm -rf /tmp/govc

# Terraform
echo "Terraforming"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - >/dev/null
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" >/dev/null
sudo apt-get install terraform

# Ansible
echo "Some basic ansible needfuls"
ansible-galaxy install geerlingguy.postgresql robertdebock.rpmfusion > /dev/null
ansible-galaxy collection install community.general >/dev/null

# Azure
#Universe package is pretty outdated, use MS official instead
echo "Setting up Azure"
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg >/dev/null
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list >/dev/null
sudo apt-get update >/dev/null
sudo apt-get install azure-cli >/dev/null

# Activate the new profile
echo "Don't forget to source $HOME/.profile"

echo "Done!"
