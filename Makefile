VALGRIND_IMAGE=seushin/valgrind

LINK_SOURCE=$(PWD)/valgrind.sh
LINK_TARGET=/usr/local/bin/valgrind
CLUS_TARGET=$(shell brew --prefix)/bin/valgrind

.PHONY: build
build:
	docker build --tag $(VALGRIND_IMAGE) .

.PHONY: clean
clean:
	docker rmi -f \
		$(shell docker images --filter=reference='$(VALGRIND_IMAGE)' --quiet)
	$(RM) $(LINK_TARGET) 2> /dev/null
	$(RM) $(CLUS_TARGET) 2> /dev/null

.PHONY: link
link:
	ln -sf $(LINK_SOURCE) $(LINK_TARGET)

.PHONY: link-cluster
link-cluster:
	ln -sf $(LINK_SOURCE) $(CLUS_TARGET)
