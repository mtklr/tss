# tss Makefile

VERSION = 0.8.2

PROG = tss
SRC = $(wildcard ./src/*.c)
OBJ = $(SRC:.c=.o)

DATA = $(wildcard ./$(PROG)_art/*)

INSTALL = /usr/bin/install
PREFIX ?= /usr/local
INSTALLDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share/$(PROG)
MANPAGE = $(PROG).6
MANDIR = $(PREFIX)/share/man/man6

CFLAGS += -DDEFAULT_ASCII_DIR=\"$(DATADIR)/\" -DBSD #-DVTLOCK
#LDFLAGS +=
LDLIBS = -lncurses

all: $(PROG) $(DATA) $(MANPAGE)

$(PROG): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

$(MANPAGE): $(MANPAGE).in
	sed 's:@datadir@:$(DATADIR):' $< >$@

clean:
	$(RM) $(PROG)
	$(RM) ./src/*.o
	$(RM) $(subst .in,,$(wildcard *.in))

install: all
	$(INSTALL) -d $(INSTALLDIR)
	$(INSTALL) $(PROG) $(INSTALLDIR)
	$(INSTALL) -d $(DATADIR)
	$(INSTALL) -m 0644 $(DATA) $(DATADIR)
	$(INSTALL) -d $(MANDIR)
	$(INSTALL) -m 0644 $(MANPAGE) $(MANDIR)

uninstall:
	$(RM) $(INSTALLDIR)/$(PROG)
	$(RM) $(foreach f,$(notdir $(DATA)),$(DATADIR)/$(f))
	$(RM) $(MANDIR)/$(MANPAGE)

.PHONY: all clean install uninstall
