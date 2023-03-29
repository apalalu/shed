#!/bin/bash

apt update -y

apt install wget curl git apt-transport-https  bash-completion gpg -y
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

curl -L -o /usr/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x /usr/bin/kubectl

wget https://siakhooi.github.io/apt/siakhooi-apt.list -O /etc/apt/sources.list.d/siakhooi-apt.list
wget https://siakhooi.github.io/apt/siakhooi-apt.gpg  -O /usr/share/keyrings/siakhooi-apt.gpg

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor > /usr/share/keyrings/helm.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm-stable-debian.list

apt update -y
apt install -y helm 

cd /opt
curl -L https://istio.io/downloadIstio | sh -
export PATH=$( ls -d /opt/istio*/bin ):$PATH
cd /working

yes | unminimize

apt install -y siakhooi-shed

kubectl completion bash > ~/.kubectl-completion
helm completion bash > ~/.helm-completion
istioctl completion bash > ~/.istioctl-completion

echo "source /etc/bash_completion" >> ~/.bashrc
echo "source ~/.kubectl-completion" >> ~/.bashrc
echo "source ~/.helm-completion" >> ~/.bashrc
echo "source ~/.istioctl-completion" >> ~/.bashrc
echo "PATH=$( ls -d /opt/istio*/bin ):\$PATH" >>~/.bashrc

echo 'source /usr/lib/shed/shed-init' >> ~/.bashrc

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

cd /opt
curl -LO https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.gz

tar xf node-v18.15.0-linux-x64.tar.gz

export PATH=/opt/node-v18.15.0-linux-x64/bin:$PATH 

echo "export PATH=/opt/node/bin:$PATH " >> ~/.bashrc

cd /working

npm i -g terminalizer
