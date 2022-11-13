#include <stdio.h>
#include <stdlib.h>

char *get(int *len, int *test) {
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

int main() {
    int len, test; 
    int l = 0;
    int n = 0;
    char *s = get(&len, &test);
    if(test == 0){
      for(int i = 0; i < len;i++){
        if(((s[i] >= 65) && (s[i] <= 90)) || ((s[i] >= 97) && (s[i] <= 122))){
          l++;
        }
        else if((s[i] >= 48) && (s[i] <= 57)){
          n++;
        }
      }
      printf("letters: %d \nnumbers: %d\n", l, n);
      return 0; 
    }
    else{
      printf("incorrect input");
      return 0;
    }
    free(s); 
    return 0;
}
