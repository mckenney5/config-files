/* Converts Celsius to Fahrenheit via stdin */
#include <stdio.h>
#include <stdlib.h>
int main(){
	char inpt[100] = {'\0'};
	fgets(inpt, 100, stdin);
	if(inpt != NULL){
		printf("%.1fF", atof(inpt) * 1.8 + 32);
		return 0;
	} else
		return 1;	
}

