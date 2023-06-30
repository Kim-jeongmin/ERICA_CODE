/*
 * Copyright 2022-2023. Heekuck Oh, all rights reserved.
 * 이 프로그램은 한양대학교 ERICA 컴퓨터학부 재학생을 위해 작성하였다.
 */
#include <stdio.h>

#define N 16

int main(void)
{
    int x;
    
    x = 0;
    #pragma omp parallel num_threads(N)
    {
        for (int i = 0; i < 20; ++i)
            x = x + 5;
    }
    printf("x = %d -- ", x);
    if (x == N*100)
        printf("YES!\n");
    else
        printf("NO!\n");
    
    return 0;
}
