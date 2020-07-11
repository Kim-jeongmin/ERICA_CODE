#include <stdio.h>

int main(void) {
  int side[3];
  // take the length of three sides
  scanf("%d %d %d", &side[0], &side[1], &side[2]);
  int a=side[0],b=side[1],c=side[2];
  if(a==b && b==c) printf("e");
  else if(a==b || b==c) printf("i");
  else printf("t");
  return 0;
}