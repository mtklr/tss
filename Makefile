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

CFLAGS += -DDEFAULT_ASCII_DIR=\"$(DATADIR)/\" -DBSD #-DVTLOCK
#LDFLAGS +=
LDLIBS = -lncurses

all: $(PROG) $(DATA)

$(PROG): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) $(PROG)
	$(RM) ./src/*.o

install: all
	$(INSTALL) -d $(INSTALLDIR)
	$(INSTALL) $(PROG) $(INSTALLDIR)
	$(INSTALL) -d $(DATADIR)
	$(INSTALL) -m 0644 $(DATA) $(DATADIR)

uninstall:
	$(RM) $(INSTALLDIR)/$(PROG)
	$(RM) $(foreach f,$(notdir $(DATA)),$(DATADIR)/$(f))

.PHONY: all clean install uninstall
