VALGRIND_IMAGE=seushin/valgrind

.PHONY: build
build:
	docker build --tag $(VALGRIND_IMAGE) .

.PHONY: link
link:
	ln -sf ./valgrind.sh /usr/local/bin/

.PHONY: link-cluster
link-cluster:
	ln -sf ./valgrind.sh $(shell brew --prefix)/bin/
