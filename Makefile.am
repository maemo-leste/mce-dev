pkgconfig_DATA = mce.pc
pkgconfigdir = $(libdir)/pkgconfig
INCLUDE_DIR   = $(DESTDIR)$(includedir)/mce

doc:
	mkdir -p doc && \
	doxygen

install: doc
	install -d $(INCLUDE_DIR) && \
	install -m644 include/mce/*.h $(INCLUDE_DIR)
	$(MAKE) install-data

clean-local:
	rm -rf doc

distclean: clean
