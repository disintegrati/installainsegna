#!/bin/sh
echo "******************************"
cd /home/pi
git clone https://github.com/mediaintegrati/insegnaraspy
echo "clonato"
cd /home/pi/insegnaraspy
echo "installo le dipendenze, mi ci vorrà un po' di tempo"
sudo npm install
echo "installo pigpio"
sudo apt-get -y install pigpio
echo "installo comitup"
wget https://davesteele.github.io/key-366150CE.pub.txt
sudo apt-key add key-366150CE.pub.txt
sudo apt-get update
sudo apt-get -y install comitup
echo "setto le interfacce wifi"
sudo mv /etc/network/interfaces /etc/network/interfaces.BAK
sudo touch /etc/network/interfaces
echo "adesso setto lo script in autorun"
sed -i "/^exit 0$/i\sudo /usr/bin/node /home/pi/insegnaraspy/index.js < /dev/null &" /etc/rc.local
echo "finito!"
echo "*******************************"
sudo reboot
