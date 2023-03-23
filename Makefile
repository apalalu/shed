clean:
	rm -rf target *.deb

build:
	./build.sh

test-man:
#	pandoc src/md/shed-config-edit.1.md -s -t man | man -l -
#	pandoc src/md/shed-config-get.1.md -s -t man | man -l -
#	pandoc src/md/shed-config.1.md -s -t man | man -l -
	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -
#	pandoc src/md/shed-env.1.md -s -t man | man -l -
#	pandoc src/md/shed-list-code.1.md -s -t man | man -l -
#	pandoc src/md/shed-list.1.md -s -t man | man -l -
#	pandoc src/md/shed.1.md -s -t man | man -l -

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0

install:
	sudo apt install -f ./siakhooi-shed_1.0.0_amd64.deb
uninstall:
	sudo apt remove -y siakhooi-shed
terminalizer:
	terminalizer render docs/terminalizer-shed.yml

run-in-container:
#	. in-container-init.sh

test:
	run-ubuntu
	run-debian

test-steps:
# docker exec -it xxxxx bash
	shed-env
	shed-config
	shed-config-get
	shed-config-edit
	shed-list
	shed-list-code
	shed-values
	shed-value
	shed-use
	shed
	shed-kubeconfig-use
	c0
	c1
	c2
	c3
	c4

	man shed-env
	man shed-config
	man shed-config-get
	man shed-config-edit
	man shed-list
	man shed-list-code
	man shed-values
	man shed-value
	man shed-use
	man shed
	man shed-kubeconfig-use
	