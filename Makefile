# libppc Makefile

VERSION =	1.0.0

CC =		gcc
CFLAGS =	-O2 -pipe -g -fPIC

LIB =		libppc.a

AR =		ar
MKDIR_P =	mkdir -p
OBJDIR =	obj
RANLIB =	ranlib
RM =		rm -rf

PREFIX =	/Developer/SDKs/MacOSX10.4u.sdk/usr

all: report ${OBJDIR} build ${LIB}

build:
	${MAKE} -C exec all
	${MAKE} -C posix_spawn all
	${MAKE} -C string all

${LIB}: build
	${AR} cru ${LIB} $(wildcard ${OBJDIR}/*.o)
	${RANLIB} ${LIB}

${OBJDIR}:
	${MKDIR_P} ${OBJDIR}

report:
	@printf "Building libppc-%s using " ${VERSION}
	@${CC} --version | awk 'NR==1'

install:
	install -m 444 man/*.3 ${DESTDIR}/usr/share/man/man3
	install -m 444 include/spawn.h ${DESTDIR}${PREFIX}/include
	install -m 444 include/stdio.h ${DESTDIR}${PREFIX}/include
	install -m 444 include/string.h ${DESTDIR}${PREFIX}/include
	install -m 444 include/unistd.h ${DESTDIR}${PREFIX}/include
	install -m 444 include/sys/*.h ${DESTDIR}${PREFIX}/include/sys
	install -m 444 ${LIB} ${DESTDIR}${PREFIX}/lib

clean:
	${RM} ${OBJDIR} ${LIB}
