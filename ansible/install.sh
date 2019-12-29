#!/bin/bash
set -eu

printf "password: "
read -s password

echo $password | sudo -S sudo apt-get update
echo $password | sudo -S sudo apt-get -y install python3-pip
echo $password | sudo -S sudo pip3 install ansible
