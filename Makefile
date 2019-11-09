VERSION=0.0.1
IMAGE=ubuntu-dotfiles:$(VERSION)
FILE_URL=https://raw.githubusercontent.com/yukin01/dotfiles/master/install.sh

build:
	docker build . -t $(IMAGE)

test-local:
	docker run -it --rm \
		-v $(HOME)/dotfiles:/home/ubuntu/tmp/dotfiles \
		-v $(HOME)/.ssh/id_rsa:/home/ubuntu/id_rsa_tmp \
		-e GIT_SSH_COMMAND="ssh -i /home/ubuntu/id_rsa_tmp" \
		$(IMAGE)

test:
	docker run -it --rm $(IMAGE) \
		/bin/bash -c "$$(curl -fsSL $(FILE_URL))"
