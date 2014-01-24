ifdef prefix
  bindir := $(prefix)/bin
  datarootdir := $(prefix)/share
  datadir := $(datarootdir)/cc65
  INSTALL = install
  DATADIRS = asminc include lib cfg targetutil emd joy mou ser tgi
  export datadir
endif

all mostlyclean clean:
	@$(MAKE) -C src    --no-print-directory $@
	@$(MAKE) -C libsrc --no-print-directory $@

avail unavail bin:
	@$(MAKE) -C src    --no-print-directory $@

lib:
	@$(MAKE) -C libsrc --no-print-directory $@

define DATAINST_recipe

$(INSTALL) -d $(DESTDIR)$(datadir)/$(ddir)
$(INSTALL) -m644 $(ddir)/* $(DESTDIR)$(datadir)/$(ddir)

endef

install:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) bin/* $(DESTDIR)$(bindir)
	$(foreach dir,$(DATADIRS),DATAINST_recipe)

%65:
	@$(MAKE) -C src    --no-print-directory $@

%:
	@$(MAKE) -C libsrc --no-print-directory $@

.PHONY: all mostlyclean clean avail unavail bin lib install

.SUFFIXES:
