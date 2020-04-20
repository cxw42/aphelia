# Copyright (c) 2018-2020 Jarred Vardy and contributors
# Portions Copyright (c) 2020 D3 Engineering, LLC.
# Licensed MIT; see accompanying LICENSE file for details.

PREFIX ?= /usr/X11R6
CFLAGS ?= -Os -pedantic -Wall

all: aphelia

aphelia: aphelia.c
	$(CC) $(CFLAGS) -I$(PREFIX)/include $< -L$(PREFIX)/lib -lX11 -o $@

install: aphelia 
	mkdir -p $(PREFIX)/bin
	cp -f $< $(PREFIX)/bin

reinstall: clean install

clean:
	-rm -f aphelia
	-rm -f $(PREFIX)/bin/aphelia
