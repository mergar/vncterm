all: cbsdvnc runcron

glyphs.h: genfont
	./genfont > glyphs.h

genfont: genfont.c
	cc -g -O2 -o $@ src/genfont.c -Wall -lz

cbsdvnc: src/vncterm.c
	cc -O2 -g -o $@ src/vncterm.c -Wall -Wno-deprecated-declarations -ljail -lvncserver -lpthread -lz -ljpeg -lutil -lgnutls -I/usr/local/include -L/usr/local/lib

runcron:
	cc src/runcron.c -o runcron -lcrypto && strip runcron

clean:
	rm -rf genfont cbsdvnc runcron *.core
