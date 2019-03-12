#! /usr/bin/env bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo 'Install Google Chrome, Git and Visual Studio Code'
touch /etc/apt/sources.list.d/google-chrome.list
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'>/etc/apt/sources.list.d/google-chrome.list
wget https://dl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update
echo 'Start install'
apt-get -y install google-chrome-stable git apt-transport-https code
apt update
echo 'Complete'
