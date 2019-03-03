INCLUDE_FILES  := include/mce/*.h
PKGCONFIG_FILE := mce.pc

INCLUDE_DIR   := $(DESTDIR)/usr/include/mce
PKGCONFIG_DIR := $(DESTDIR)/usr/lib/pkgconfig

doc:
	mkdir -p doc && \
	doxygen

%.pc: %.pc.in
	VERSION=$(shell dpkg-parsechangelog | sed -ne 's/^Version: //p') && \
	sed "s/@VERSION@/$$VERSION/g" $< > $@

install: doc $(PKGCONFIG_FILE)
	install -d $(PKGCONFIG_DIR) $(INCLUDE_DIR) && \
	install -m644 $(PKGCONFIG_FILE) $(PKGCONFIG_DIR) && \
	install -m644 $(INCLUDE_FILES) $(INCLUDE_DIR)

clean:
	rm -rf $(PKGCONFIG_FILE) doc

distclean: clean
