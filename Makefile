VALGRIND_IMAGE=seushin/valgrind

LINK_SOURCE=$(PWD)/valgrind.sh
LINK_TARGET=/usr/local/bin/valgrind
CLUSTER_BIN_PATH=$(PWD)/bin/

.PHONY: all
all: build link

.PHONY: cluster
cluster: build link-cluster

.PHONY: build
build:
	docker build --tag $(VALGRIND_IMAGE) .

.PHONY: clean
clean:
	docker rmi -f \
		$(shell docker images --filter=reference='$(VALGRIND_IMAGE)' --quiet)
	$(RM) $(LINK_TARGET) 2> /dev/null
	$(RM) $(CLUSTER_BIN_PATH)/valgrind 2> /dev/null

.PHONY: link
link:
	ln -sf $(LINK_SOURCE) $(LINK_TARGET)

.PHONY: link-cluster
link-cluster:
	mkdir -p $(CLUSTER_BIN_PATH)
	ln -sf $(LINK_SOURCE) $(CLUSTER_BIN_PATH)/valgrind
	echo 'export PATH="$$PATH:$(CLUSTER_BIN_PATH)"' >> $(HOME)/.zshrc
