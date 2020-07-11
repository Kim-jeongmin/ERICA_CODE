#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int i;
  srand((unsigned int) time(NULL));
  for(i=0; i<3; i++){
    printf("%d\t", rand());
  }
  return 0;
}