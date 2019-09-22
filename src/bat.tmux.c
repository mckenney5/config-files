/* Parses acpi's output returns the battery percentages with tmux formatting */
/* tmux uses the #[fg=<color>] in stdout to set text color instead of ASCII codes */
#include <stdio.h>	//printf
#include <stdlib.h>	//atoi

#define SIZE 100	//Fixed array sizes
#define MAX 5		//Max ammount of batteries to display
#define LOW 10		//Battery percentage that is considered low
#define MED 40		//Battery percentage that is considered medium

/* Colors */
#define LOW_COLOR "red"
#define MED_COLOR "yellow"
#define GOOD_COLOR "green"
#define NORMAL_COLOR "white"

int main(){
	size_t i, l=0, nmembr=0;
	char bat[SIZE] = {'\0'};
	char inpt[SIZE] = {'\0'};
	int batlvl[MAX] = {0};
	for(i=0; i < SIZE; i++){ //get the acpi input
		inpt[i] = getc(stdin);
		if(inpt[i] == EOF || inpt[i] == '\0') break;
	}
	for(i=0; i < SIZE; i++){ //tokenize into an int array (batlvl)
		if(inpt[i] == '%'){
			for( ; inpt[i] != ' ' && i > 0; i--) NULL; //go back to the beginning of the word
			for( ++i; inpt[i] != '%' && i < SIZE; i++){ //copy that word into our array
				bat[l] = inpt[i];
				l++;
			}
			batlvl[nmembr] = atoi(bat); //add the number to a number array
			nmembr++;
			l=0;
			bat[0] = '\0'; //overwrite the string
		}
	}
	for(i=0; i < nmembr; i++){ //display the data
		if(batlvl[i] > 100) batlvl[i] /= 10; //fixes extra zero if bat0 is at 100%
		if(batlvl[i] <= LOW && i+1 != nmembr) //if the battery is low and theres another battery
			printf("#[fg=%s]%d%s #[fg=%s]", LOW_COLOR, batlvl[i], "%!", NORMAL_COLOR);
		else if(batlvl[i] <= LOW && i+1 == nmembr) //if the battery is low
			printf("#[fg=%s]%d%s#[fg=%s]", LOW_COLOR, batlvl[i], "%!", NORMAL_COLOR);
		else if(batlvl[i] <= MED && i+1 != nmembr) //if the battery is medium and theres another battery
			printf("#[fg=%s]%d%s #[fg=%s]", MED_COLOR, batlvl[i], "%", NORMAL_COLOR);
		else if(batlvl[i] <= MED && i+1 == nmembr) //if the battery is medium
			printf("#[fg=%s]%d%s#[fg=%s]", MED_COLOR, batlvl[i], "%", NORMAL_COLOR);
		else if(i+1 == nmembr)
			printf("#[fg=%s]%d%s#[fg=%s]", GOOD_COLOR, batlvl[i], "%", NORMAL_COLOR);
		else
			printf("#[fg=%s]%d%s #[fg=%s]", GOOD_COLOR, batlvl[i], "%", NORMAL_COLOR);
	}
	return 0;
}

