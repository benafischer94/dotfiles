#!/bin/bash
# Downloading latest julia
echo "Downloading and installing Julia Lang"
mkdir /tmp/julia > /dev/null
pushd /tmp/julia > /dev/null
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.3-linux-x86_64.tar.gz -O ./julia.tar.gz > /dev/null
tar zxvf julia.tar.gz >/dev/null
rm julia.tar.gz
sudo mv ./julia* /usr/local/bin/julia > /dev/null
popd > /dev/null
rm -rf /tmp/julia
exit 0