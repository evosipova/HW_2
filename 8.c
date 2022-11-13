#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
char *get(FILE *input, int *len, int *test) {
    *len = 0; 
    *test = 0;
    int cap = 1; 
    char *s = (char*) malloc(sizeof(char)); 
    char c = fgetc(input);
    if(c > 127){
      (*test)++;
    }  
    while (c != EOF) {
        s[(*len)++] = c; 
        if (*len >= cap) {
            cap *= 2; 
            s = (char*) realloc(s, cap * sizeof(char)); 
        }

        c = fgetc(input);
	if(c > 127){
          (*test)++;
        }          
    }
    s[*len] = '\0'; 
    return s;
}
char *get2(int *len, int *test) {
    *len = 0; 
    *test = 0;
    int cap = 1; 
    char *s = (char*) malloc(sizeof(char)); 
    char c = getchar();
    if(c > 127){
      (*test)++;
    }  
    while (c != '\n') {
        s[(*len)++] = c; 
        if (*len >= cap) {
            cap *= 2; 
            s = (char*) realloc(s, cap * sizeof(char)); 
        }

        c = getchar();
	if(c > 127){
          (*test)++;
        }          
    }
    s[*len] = '\0'; 
    return s; 
}
void l_n(char *s, int len, int *l, int *n){
	for(int j = 0; j < 100000;j++){
	  *l = 0;
	  *n = 0;
	  for(int i = 0; i < len;i++){
		if(((s[i] >= 65) && (s[i] <= 90)) || ((s[i] >= 97) && (s[i] <= 122))){
		  (*l)++;
		}
		else if((s[i] >= 48) && (s[i] <= 57)){
		  (*n)++;
		}
	      }
	}
}
char *get_random_string(int *len){
  srand(time(NULL));
  *len = rand()%10000; 
  char *s = (char*) malloc(*len * sizeof(char));
  for(int i = 0; i < *len; i++){
    if(i % 2 == 0){
      s[i] = rand()%26 + 'A';
    }
    else{
      s[i] = rand()%10 + '0';
    }
  }
  return s; 
}
int main(int argc, char *argv[]) {
  if (argc != 2){
  	printf("incorrect input!\n");
  	return 0;
  }
  clock_t start, end;
  int len, test;
  if(strcmp(argv[1], "-r") == 0){
    int l = 0;
    int n = 0;
    char *s = get_random_string(&len);
    printf("%s \n %d \n", s, len);
    start = clock();
    l_n(s, len, &l, &n);
    end = clock();
    printf("letters: %d \nnumbers: %d\n", l, n);
    printf("time: %.4lf\n", (double)(end-start)/(CLOCKS_PER_SEC));
    free(s);
  }
  else if(strcmp(argv[1], "-h") == 0){
    printf("-h help\n");
    printf("-r create random string\n");
    printf("-f use string from input.txt and save result in output.txt\n");
    printf("-s use string from terminal and return result in terminal\n");
  }
  else if(strcmp(argv[1], "-f") == 0){
    FILE *input = fopen("input.txt", "r");
    FILE *out = fopen("output.txt", "w");
    if ((out == NULL) || (input == NULL)){
    	printf("wrong file!\n");
    	return 0;
    }
    int len; 
    int l = 0;
    int n = 0;
    char *s = get(input, &len, &test);
    start = clock(); 
    l_n(s, len, &l, &n);
    end = clock();
    fprintf(out, "letters: %d \nnumbers: %d\n", l, n);
    printf("time: %.4lf\n", (double)(end-start)/(CLOCKS_PER_SEC));
    free(s); 
    fclose(input);
    fclose(out);
  }
  else if(strcmp(argv[1], "-s") == 0){
    int l = 0;
    int n = 0;
    char *s = get2(&len, &test); 
    start = clock();
    l_n(s, len, &l, &n);
    end = clock();
    printf("letters: %d \nnumbers: %d\n", l, n);
    printf("time: %.4lf\n", (double)(end-start)/(CLOCKS_PER_SEC));
    free(s);
  }
  return 0;
}
