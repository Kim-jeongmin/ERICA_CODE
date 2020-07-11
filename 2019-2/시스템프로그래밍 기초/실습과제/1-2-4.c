#include <stdio.h>

/* print Fahrenheit-Celsius mutable
    for fahr = 0, 20, ..., 300; floating-point version */

int main(void) {
  float fahr, celsius;
  float lower, upper, step;
  
  lower = 0;    /* lower limit of temperature table */
  upper = 300;  /* upper limit */
  step = 20;    /* step size */
  
  fahr = lower;
  while (fahr <= upper){
    celsius = 5 * (fahr-32) /9 ;
    printf("%.2f\t%.2f\n", fahr, celsius);
    fahr = fahr + step;
  }
  
  return 0;
}