#! /usr/bin/env bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
function t-d-uninstaller {
rm -rf $tmp_dir
echo "Temporary directory uninstalled"
exit 1
}
tmp_dir=$(mktemp -d -t pub_key-XXXXXX)
trap t-d-uninstaller SIGINT SIGTERM
echo $tmp_dir
echo 'deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main'>/etc/apt/sources.list.d/google-chrome.list
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add linux_signing_key.pub
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $tmp_dir/microsoft.gpg
install -o root -g root -m 644 $tmp_dir/microsoft.gpg /etc/apt/trusted.gpg.d/
apt update
echo 'Start install'
apt-get -y install google-chrome-stable git apt-transport-https code
t-d-uninstaller