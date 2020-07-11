#include <stdio.h>

int main(void) {
  int a, b = 0, c = 0;
  // fill this inline
  a = ++b + ++c;
  printf("%d %d %d\n", a, b, c);
  return 0;
}