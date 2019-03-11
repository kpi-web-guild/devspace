#!/usr/bin/env bash
echo 'Instal Googe Chrome'
sudo bash -c "touch /etc/apt/sources.list.d/google-chrome.list && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'>/$
wget https://dl.google.com/linux/linux_signing_key.pub
sudo bash -c "apt-key add linux_signing_key.pub && apt update && apt install google-chrome-stable"
echo 'Chrome installed, installing git..'
sudo apt-get install git
echo 'Git installed, installing Visual studio code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo bash -c "install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo bash -c "apt-get install apt-transport-https && apt-get update && apt-get install code"
echo 'Complete'
