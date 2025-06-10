#include <stdio.h>

/*
	Comments outside the program
*/

void another_function() {
	return;
}

int main() {
	/*
		Comments inside the program
	*/
	char *s = "#include <stdio.h>%c%c/*%c%cComments outside the program%c*/%c%cvoid another_function() {%c%creturn;%c}%c%cint main() {%c%c/*%c%c%cComments inside the program%c%c*/%c%cchar *s = %c%s%c;%c%cprintf(s,10,10,10,9,10,10,10,10,9,10,10,10,10,9,10,9,9,10,9,10,9,34,s,34,10,9,10,9,10);%c%creturn 0;%c}";
	printf(s,10,10,10,9,10,10,10,10,9,10,10,10,10,9,10,9,9,10,9,10,9,34,s,34,10,9,10,9,10);
	return 0;
}