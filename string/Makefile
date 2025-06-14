# libppc/string Makefile

CC =		gcc
CFLAGS =	-O2 -pipe -g -fPIC

SRCS =	$(wildcard *.c)
OBJS =	$(patsubst %.c,%.o,$(wildcard *.c))

OBJDIR =	../obj

all: ${OBJS}

${OBJS}: ${SRCS}
	${CC} ${CFLAGS} -c $< -o ${OBJDIR}/$@
