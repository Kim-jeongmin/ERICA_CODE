#include <stdio.h>
#include <stdlib.h>

int main() {
  int score;
  int numOfScores;
  scanf("%d", &numOfScores);
  for(int i=0; i<numOfScores; i++){
    scanf("%d", &score);
    if(score >= 60){
      if(90<=score) printf("A\n");
      else if(80<=score) printf("B\n");
      else if(70<=score) printf("C\n");
      else printf("F\n");
    } else {
      printf("Failed\nTry again\n");
    }    
  }
  return 0;
}