.PHONY: install run mozc nvidia

install:
	sudo apt update
	sudo apt install -y python3-pip
	sudo pip3 install ansible

run:
	ansible-playbook -i hosts ubuntu.yml --ask-become-pass -v

mozc:
	sudo apt install -y ibus-mozc

nvidia:
	sudo add-apt-repository ppa:graphics-drivers/ppa
