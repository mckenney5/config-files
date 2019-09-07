/* Parses acpi's out put returns the battery percentages */
#include <stdio.h>
#define SIZE 100
int main(){
	size_t i, l=0;
	char bat[SIZE] = {'\0'};
	char inpt[SIZE] = {'\0'};
	for(i=0; i < SIZE; i++){
		inpt[i] = getc(stdin);
		if(inpt[i] == EOF || inpt[i] == '\0') break;
	}
	for(i=0; i < SIZE; i++){
		if(inpt[i] == '%'){
			for( ; inpt[i] != ' ' && i > 0; i--) NULL; //go back to the beginning of the word
			for( ++i; inpt[i] != '%' && i < SIZE; i++){ //copy that word into our array
				bat[l] = inpt[i];
				l++;
			}
			bat[l] = '%'; //do some nice formatting
			bat[++l] = ' ';
			bat[++l] = ' ';
		}
	}
	bat[l] = '\0'; //remove any extra spaces
	bat[l-1] = '\0';
	printf("%s", bat);
	return 0;
}

