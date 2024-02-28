# Definición del compilador por defecto
CC=gcc
# Si CROSS_COMPILE está definido, se prependerá a la llamada del compilador
ARCH=$(CROSS_COMPILE)$(CC)

# El objetivo por defecto que se ejecutará si solo escribes 'make' en la terminal
default: writer

# Regla para compilar el ejecutable 'writer' a partir de los archivos objeto
writer: writer.o
	# $(ARCH) se expandirá al compilador que se usará, dependiendo de si CROSS_COMPILE está definido
	# $^ se refiere a todas las dependencias del objetivo, en este caso 'writer.o'
	# $@ se refiere al nombre del objetivo, en este caso 'writer'
	$(ARCH) $^ -o $@

# Regla para compilar 'writer.o' a partir de 'writer.c'
writer.o: writer.c
	# Similar a la regla anterior, $(ARCH) especifica el compilador
	# -c indica al compilador que genere un archivo objeto (.o) sin enlazar
	# $< se refiere a la primera dependencia del objetivo, en este caso 'writer.c'
	$(ARCH) -c $<

# Un objetivo 'phony' para 'clean', lo que significa que no está vinculado a archivos de nombre 'clean'
.PHONY: clean
clean:
	# Comando para eliminar todos los archivos objeto y el ejecutable 'writer'
	# Esto ayuda a limpiar el directorio de trabajo para una nueva compilación
	rm -f *.o writer
