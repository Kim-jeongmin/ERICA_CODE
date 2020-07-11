#include <stdio.h>
#include <stdlib.h>

void printMatrix(int, int, double**);

int main(void) {
  // take n by m matrix
  int n, m;
  scanf("%d %d", &n, &m);
  double **matrix = (double**)malloc(sizeof(double*) * n);
  double **matrix1 = (double**)malloc(sizeof(double*) * n);
  for(int i=0;i<n;i++){
  	matrix1[i] = (double*)malloc(sizeof(double) * m); 
    matrix[i] = (double*)malloc(sizeof(double) * m);
    for(int j=0; j<m; j++){
      scanf("%lf", &matrix[i][j]);
      matrix1[i][j] = (i == j)?1:0;
		}
  }
  // your codes her
	for(int i=0;i<n;i++){
		double p = matrix[i][i];
		for(int j=0;j<m;j++){
			matrix[i][j]/=p;
			matrix1[i][j]/=p;
		}
		for(int j=i+1;j<n;j++){
			double p2 = matrix[j][i];
			for(int k=0;k<m;k++){
			matrix[j][k] += matrix[i][k] * p2 * (-1);
			matrix1[j][k] += matrix1[i][k] * p2 * (-1); 			
			}
		}
		
	}
	for(int i=n-1;i>=0;i--){
		double p = matrix[i][i];
		for(int j=i-1;j>=0;j--){
			double p2=matrix[j][i];
			for(int k=n-1;k>=0;k--){
				matrix[j][k] += matrix[i][k] * p2 * (-1);
				matrix1[j][k] += matrix1[i][k] * p2 * (-1);
			}
		}
	}
	printMatrix(n,m,matrix1);
	
  // de-allocate the memory
  for(int i=0; i<n; i++){
    free(matrix[i]);
    free(matrix1[i]);
  }
  free(matrix1);
  free(matrix);
  return 0;
}

void printMatrix(int n, int m, double **matrix){
  for(int i=0; i<n; i++){
    for(int j=0; j<m; j++){
      printf("%.1lf ", matrix[i][j]);
    }
    printf("\n");
  }
}