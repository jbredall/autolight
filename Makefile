# -*- MakeFile -*-
ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif
PROJECT=autolight

all: src test
.PHONY: src clean install uninstall test

src:
	@ $(MAKE) --no-print-directory -C src/

clean:
	@ echo Cleaning autolight source tree...
	@ $(MAKE) --no-print-directory -C src/ clean

test:
	@ $(MAKE) --no-print-directory -C src/ test

install: bin/$(PROJECT)
	@ echo Installing to $(DESTDIR)$(PREFIX)/bin...
	@ install -d $(DESTDIR)$(PREFIX)/bin/
	@ install -m 755 bin/$(PROJECT) $(DESTDIR)$(PREFIX)/bin/
	@ install -d $(DESTDIR)$(PREFIX)/etc/
	@ install -m 666 etc/$(PROJECT).conf $(DESTDIR)$(PREFIX)/etc/
	@ echo Done!

uninstall:
	@ echo Uninstalling from $(DESTDIR)$(PREFIX)/bin...
	@ rm -f $(DESTDIR)$(PREFIX)/bin/$(PROJECT)
	@ echo Done!
