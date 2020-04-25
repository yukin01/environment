#!/bin/bash
set -eu

read -p "password: " -s password

echo $password | sudo -S apt-get update
echo $password | sudo -S apt-get -y install python3-pip
echo $password | sudo -S pip3 install ansible
