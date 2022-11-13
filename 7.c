#include <stdio.h>
#include <stdlib.h>

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
void l_n(char *s, int len, int *l, int *n){
  for(int i = 0; i < len;i++){
        if(((s[i] >= 65) && (s[i] <= 90)) || ((s[i] >= 97) && (s[i] <= 122))){
          (*l)++;
        }
        else if((s[i] >= 48) && (s[i] <= 57)){
          (*n)++;
        }
      }
}
int main(int argc, char * argv[]) {
  if (argc != 3){
	  printf("incorrect input!\n");
	  return 0;
  }
  FILE *input = fopen(argv[1], "r");
  FILE *out = fopen(argv[2], "w");
  if ((out == NULL) || (input == NULL)){
	  printf("wrong file!\n");
	  return 0;
  }
  int len, test; 
  int l = 0;
  int n = 0;
  char *s = get(input, &len, &test); 
  if(test == 0){
      l_n(s, len, &l, &n);
      fprintf(out, "letters: %d \nnumbers: %d\n", l, n);
      free(s); 
      fclose(input);
      fclose(out);
      return 0; 
  }
  else{
      fprintf(out, "incorrect input");
      free(s); 
      fclose(input);
      fclose(out);
      return 0;
  } 
}
