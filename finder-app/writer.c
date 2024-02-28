#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    // Inicializa el logging de syslog.
    openlog("writer", LOG_PID|LOG_CONS, LOG_USER);
    
    // Verifica que se hayan proporcionado los argumentos correctos.
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Se requieren exactamente dos argumentos, una ruta de archivo y una cadena de texto.");
        fprintf(stderr, "Uso: %s <ruta_de_archivo> <cadena_de_texto>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    // Registra el intento de escritura.
    syslog(LOG_DEBUG, "Escribiendo '%s' en '%s'", writestr, writefile);

    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: No se pudo abrir el archivo '%s' para escritura.", writefile);
        exit(EXIT_FAILURE);
    }

    // Escribe la cadena en el archivo.
    if (fputs(writestr, file) == EOF) {
        syslog(LOG_ERR, "Error: No se pudo escribir en el archivo '%s'.", writefile);
        fclose(file); // Asegura que el archivo se cierra correctamente.
        exit(EXIT_FAILURE);
    }

    // Cierra el archivo y registra el éxito de la operación.
    fclose(file);
    syslog(LOG_INFO, "Archivo '%s' creado y escrito exitosamente.", writefile);

    // Cierra el logging de syslog.
    closelog();

    return 0;
}
