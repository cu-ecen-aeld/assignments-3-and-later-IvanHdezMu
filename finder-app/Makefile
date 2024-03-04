# Definición del compilador por defecto
CC=gcc
# Si CROSS_COMPILE está definido, se prependerá a la llamada del compilador
ARCH=$(CROSS_COMPILE)$(CC)


srcs = writer.c
objs = $(srcs:.c=.o)

.PHONY: all
all: writer

.PHONY: clean
clean:
	rm -f writer *.o

$(objs): %.o: %.c
	#$(CROSS_COMPILE)gcc -c $<
	$(ARCH) $^ -o $@


writer: $(objs)
	#$(CROSS_COMPILE)gcc -o $@ $?
	$(ARCH) $^ -o $@

