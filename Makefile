VERSION=0.0.1
IMAGE=ubuntu-dotfiles:$(VERSION)

build:
	docker build . -t $(IMAGE)

test-local:
	docker run -it --rm \
		-v $(PWD):/home/ubuntu/tmp/dotfiles \
		-v $(PWD)/.ssh/id_rsa:/home/ubuntu/id_rsa_tmp \
		$(IMAGE)
