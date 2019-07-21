#!/bin/bash
set -eu

printf "password: "
read -s password

echo $password | sudo -S apt update
echo $password | sudo -S apt install --yes software-properties-common
echo $password | sudo -S apt-add-repository --yes --update ppa:ansible/ansible
echo $passowrd | sudo -S apt install --yes ansible
