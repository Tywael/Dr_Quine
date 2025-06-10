#include<stdio.h>
#define FILENAME "Grace_kid.c"
#define CONTENT "#include<stdio.h>%1$c#define FILENAME %2$cGrace_kid.c%2$c%1$c#define CONTENT %2$c%3$s%2$c%1$c#define NOT_MAIN int main(){FILE *f=fopen(FILENAME,%2$cw%2$c);if(!f){return(-1);}else{fprintf(f,CONTENT,10,34,CONTENT);fclose(f);return(0);}}%1$c/*%1$c	Definitly not a main%1$c*/%1$cNOT_MAIN"
#define NOT_MAIN int main(){FILE *f=fopen(FILENAME,"w");if(!f){return(-1);}else{fprintf(f,CONTENT,10,34,CONTENT);fclose(f);return(0);}}
/*
	Definitly not a main
*/
NOT_MAIN