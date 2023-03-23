#!/bin/bash

apt update -y

apt install wget -y
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

wget https://siakhooi.github.io/apt/siakhooi-apt.list -O /etc/apt/sources.list.d/siakhooi-apt.list
wget https://siakhooi.github.io/apt/siakhooi-apt.gpg  -O /usr/share/keyrings/siakhooi-apt.gpg
apt update -y

yes | unminimize

apt install -y ./siakhooi-shed_0.3.0_amd64.deb

echo 'source /usr/lib/shed/shed-init' >> ~/.bashrc

git config --global user.email "you@example.com"
git config --global user.name "Your Name"
