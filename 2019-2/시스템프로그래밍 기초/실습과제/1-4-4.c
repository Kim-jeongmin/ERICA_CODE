#include <stdio.h>
#include <stdlib.h>

void takeMatrix(int, int, int**);
void printMatrix(int, int, int**);

int main(void) {
  int n, m, **matrix1, **matrix2;
  scanf("%d %d", &n, &m);
  
  // initialize matrices
  matrix1 = (int**)malloc(sizeof(int*) * n);
  matrix2 = (int**)malloc(sizeof(int*) * n);
  
  // fill matrices  
  takeMatrix(n, m, matrix1);
  takeMatrix(n, m, matrix2);

  // your codes here
  int **matrix;
  matrix = (int**)malloc(sizeof(int*) * n);
  for(int h=0;h<n;h++){
  	matrix[h] = (int*)malloc(sizeof(int) * m);
  }
  for(int i=0;i<n;i++){
  	for(int j=0;j<m;j++){
  		for(int k=0;k<m;k++){
  			matrix[i][j]|=matrix1[i][k]&&matrix2[k][j];
		  }
	  }
	  
  }
  printMatrix(n,m,matrix);
  
  
  
  // de-allocate the memory
  for(int i=0; i<n; i++){
    free(matrix1[i]);
    free(matrix2[i]);
    free(matrix[i]);
  }
  free(matrix1);
  free(matrix2);
  free(matrix);
  return 0;
}

void takeMatrix(int n, int m, int **matrix){
  for(int i=0; i<n; i++){
    matrix[i] = (int *)malloc(sizeof(int) * m);
    for(int j=0; j<m; j++){
      scanf("%d", &matrix[i][j]);
    }
  }
}

void printMatrix(int n, int m, int **matrix){
  for(int i=0; i<n; i++){
    for(int j=0; j<m; j++){
      printf("%d ", matrix[i][j]);
    }
    printf("\n");
  }
}