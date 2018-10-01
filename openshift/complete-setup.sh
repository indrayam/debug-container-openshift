#!/bin/bash

mkdir ~/src
cd ~/src

# Setup the container
cd ~/src
curl -L https://storage.googleapis.com/us-east-4-anand-files/misc-files/all-bootstrap.tar.gz.enc -H 'Accept: application/octet-stream' --output all-bootstrap.tar.gz.enc
openssl aes-256-cbc -d -in all-bootstrap.tar.gz.enc -out all-bootstrap.tar.gz
tar -xvzf all-bootstrap.tar.gz
mkdir -p ~/.ssh
mv container-bootstrap/ssh/* ~/.ssh/
chmod 700 ~/.ssh/
mkdir -p ~/.kube
mv container-bootstrap/kube/* ~/.kube/
mv container-bootstrap/git/gitconfig ~/.gitconfig
mv container-bootstrap/mc ~/.mc
mv container-bootstrap/helm ~/.helm
ssh -o "StrictHostKeyChecking no" -T git@github.com

# Setup Helm
cd ~/src
tar -xvzf helm-v2.11.0-linux-amd64.tar.gz
mv linux-amd64/helm ~/bin
chmod +x ~/bin/helm

# Setup fzf
cd ~
~/.fzf/install --all

# Setup Vim
#rm -rf ~/.vim/bundle/Vundle.vim
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim -c 'PluginInstall' -c 'qall'


# Final touches...
mkdir -p ~/workspace/go-apps/bin
mkdir -p ~/workspace/go-apps/src
mkdir -p ~/workspace/go-apps/pkg
echo "You're done! Remove complete-setup.sh file and then source your ~/.bashrc!"
