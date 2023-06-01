/* Searches via the terminal */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 1024
#define WEB_BROWSER "w3m"
#define SEARCH_ENGINE "https://html.duckduckgo.com/html/?q="

int main(int argc, char *argv[]){
	if(argc == 1){
		fprintf(stderr, "usage: %s <search_term>\n", argv[0]);
		return 1;
	}

	char search_q[MAX+1] = {'\0'}; //holds search term
	
	//take all of the command line args and make them a search term
	size_t i = 0, l = 0, chars = 0;
	for(i = 1; chars < MAX && i < argc; i++){
		for(l = 0; argv[i][l] != '\0' && chars < MAX; l++){
			search_q[chars++] = argv[i][l];
		}
		search_q[chars++] = '+'; //replaces spaces with plus signs
	}
	search_q[chars-1] = '\0'; //removes trailing +

	//create command from the web browser and search engine
	char *cmd = NULL;
	size_t size = strlen(WEB_BROWSER) + strlen(SEARCH_ENGINE) + chars + 2; //2 for space and null char
	cmd = malloc(sizeof(char) * size);
	if(!cmd){
		perror("FATAL. Unable to allocate memory. ");
		return 2;
	}

	snprintf(cmd, size, "%s %s%s", WEB_BROWSER, SEARCH_ENGINE, search_q); //create the command
	return system(cmd); //run the command
	free(cmd); //unreachable
}

