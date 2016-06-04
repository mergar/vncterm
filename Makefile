PACKAGE=vncterm
VERSION=1.2

all: vncterm

glyphs.h: genfont
	./genfont > glyphs.h

genfont: genfont.c
	cc -g -O2 -o $@ src/genfont.c -Wall -lz

vncterm: src/vncterm.c
	cc -O2 -g -o cbsdvnc src/vncterm.c -Wall -Wno-deprecated-declarations -ljail -lvncserver -lpthread -lz -ljpeg -lutil -lgnutls -I/usr/local/include -L/usr/local/lib

clean:
	rm -rf genfont cbsdvnc *.core
