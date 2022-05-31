VALGRIND_IMAGE=seushin/valgrind

.PHONY: build
build:
	docker build --tag $(VALGRIND_IMAGE) .

.PHONY: link
link:
	ln -sf $(PWD)/valgrind.sh /usr/local/bin/valgrind

.PHONY: link-cluster
link-cluster:
	ln -sf $(PWD)/valgrind.sh $(shell brew --prefix)/bin/valgrind
