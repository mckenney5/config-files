/* Converts Celsius to Fahrenheit via stdin */
#include <stdio.h>
#include <stdlib.h>
int main(){
	char inpt[101] = {'\0'};
	fgets(inpt, 100, stdin);
	if(inpt != NULL){
		printf("%.1fF", atof(inpt) * 1.8 + 32);
		return EXIT_SUCCESS;
	} else
		return EXIT_FAILURE;
}

