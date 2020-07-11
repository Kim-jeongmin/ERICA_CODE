#include <stdio.h>

int main(void) {
  int number;
  printf("input a number: ");
  scanf("%d", &number);
  int sum=0;
  for(int i=2;i<number;i++){
    if(number%i==0) sum+=1;
  }
  if(sum==0) printf("prime");
  else printf("composite");
  return 0;
}