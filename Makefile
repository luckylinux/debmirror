.PHONY: clean check

all: debmirror.1

check:
	perl -cw debmirror

debmirror.1: debmirror
	pod2man $< >$@

clean:
	rm -f debmirror.1
	$(MAKE) -C test $@
