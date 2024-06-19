#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){
int i = 5;
if (strcmp(__FILE__, "c/Sully.c") != 0) i--;
if (i<0) return -1;
char filename[50];
char command[128];
sprintf(filename, "Sully_%d.c", i);
FILE *f = fopen(filename, "w");
if (!f) return -1;
char *str = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$cint main(){%1$cint i = %3$d;%1$cif (strcmp(__FILE__, %2$cc/Sully.c%2$c) != 0) i--;%1$cif (i<0) return -1;%1$cchar filename[50];%1$cchar command[128];%1$csprintf(filename, %2$cSully_%%d.c%2$c, i);%1$cFILE *f = fopen(filename, %2$cw%2$c);%1$cif (!f) return -1;%1$cchar *str = %2$c%4$s%2$c;%1$cfprintf(f,str,10,34,i,str);%1$csprintf(command, %2$cgcc -Wall -Wextra -Werror -o Sully_%%d %%s && ./Sully_%%d%2$c, i, filename, i);%1$cfclose(f);%1$csystem(command);%1$c}";
fprintf(f,str,10,34,i,str);
sprintf(command, "gcc -Wall -Wextra -Werror -o Sully_%d %s && ./Sully_%d", i, filename, i);
fclose(f);
system(command);
}