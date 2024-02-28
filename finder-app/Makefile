# Nombre del archivo fuente y el ejecutable
SRC = writer.c
OBJ = $(SRC:.c=.o)
EXEC = writer

# Comprobamos si la variable CROSS_COMPILE está establecida
ifdef CROSS_COMPILE
	CC = $(CROSS_COMPILE)gcc
else
	CC = gcc
endif

# Flags de compilación
CFLAGS = -Wall

# Objetivo predeterminado
all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(EXEC)
	@echo "Construcción completada."

# Compilación de objetos .c a .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Limpieza de archivos
clean:
	rm -f $(EXEC) $(OBJ)
	@echo "Limpieza completada."

# Marcamos 'clean' como un objetivo falso para evitar conflictos de archivos.
.PHONY: all clean
