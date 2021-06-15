/* Parses ansiweather, requires piped input */
#include <stdio.h>
#include <string.h>

#define MAX_INPUT 100

int main(){
	char input[100] = {'\0'};
	size_t i = 0;
	int response = 0;
	for(i = 0; (response = getc(stdin)) != '\n' && i < MAX_INPUT; i++)
		input[i] = (char) response;

	char *weather = NULL;
	weather = strtok(input, ">");
	weather = strtok(NULL, ">");
	
	weather[strlen(weather)-1] = '\0'; //remove trailing space
	
	for(i=1; weather[i] != '\0' && weather[i] != ' '; i++) //removes begining space and places the temp and unit together
		putchar(weather[i]);

	for(++i; weather[i] != '\0'; i++) //displays the rest of the info
		putchar(weather[i]);

	return 0;
}
