#! /usr/bin/bash

# Oh my posh!
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh

# Move around the shared resources
ln -s ../shared/bfischer.omp.json ~/.poshthemes/bfischer.omp.json
