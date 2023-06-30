/*
 * Copyright(c) 2023 All rights reserved by Heekuck Oh.
 * 이 프로그램은 한양대학교 ERICA 컴퓨터학부 학생을 위한 교육용으로 제작되었다.
 * 한양대학교 ERICA 학생이 아닌 이는 프로그램을 수정하거나 배포할 수 없다.
 * 프로그램을 수정할 경우 날짜, 학과, 학번, 이름, 수정 내용을 기록한다.
 */
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <sys/time.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <pthread.h>

#define GROUP 16            /* 스레드의 개수 = 검색 구간의 개수 */
#define START 0x3B9ACA00    /* 검색 시작 값 */
#define SPAN 0x002625A0     /* 구간의 크기 */

/*
 * count는 스레드 사이에서 공유하는 변수로 소수의 개수를 누적하기 위해 사용한다.
 * 원자변수는 그 값을 원자적으로 변경하기 위해 사용한다. 자세한 것은 6장에서 배운다.
 */
atomic_int count;

/*
 * n이 소수인지 판별하는 매우 *비효율적인* 함수로 일부러 시간을 끌기 위해 만들었다.
 * 소수를 판별하는 빠른 알고리즘은 컴퓨터학부 암호학 과목에서 배운다.
 */
bool isprime(uint64_t n)
{
    uint64_t p = 5;
    
    if (n == 2 || n == 3)
        return true;
    if (n == 1 || n % 2 == 0 || n % 3 == 0)
        return false;
    while (n >= p*p)
        if (n % p == 0 || n % (p + 2) == 0)
            return false;
        else
            p += 6;
    return true;
}

/*
 * 어떤 구간에 소수가 몇 개 있는지 계산하는 함수로 스레드를 생성하여 실행한다.
 */
void *foo(void *arg)
{
    int i = *(int *)arg;

    for (int n = START+i*SPAN; n < START+(i+1)*SPAN; ++n)
        if (isprime(n))
            ++count;
    pthread_exit(NULL);
}

/*
 * 스레드 생성과 병렬 실행을 시험하기 위해 작성된 메인 함수이다.
 * 세 가지 방식으로 GROUP개의 구간에서 발견한 소수의 총 개수와 시간을 출력한다.
 */
int main(void)
{
    int i, arg[GROUP];
    pthread_t tid[GROUP];
    struct timeval start, end;
    double elapsed;
    
    printf("%d부터 %d까지 소수를 찾는다.\n", START, START+GROUP*SPAN);
    /*
     * GROUP개의 구간에서 소수를 순차적으로 찾는다.
     */
    gettimeofday(&start, NULL);
    printf("순차 계산...\n");
    int cnt = 0;
    for (i = 0; i < GROUP; ++i)
        for (int n = START+i*SPAN; n < START+(i+1)*SPAN; ++n)
            if (isprime(n))
                ++cnt;
    gettimeofday(&end, NULL);
    elapsed = (double)(end.tv_sec - start.tv_sec)+(double)(end.tv_usec - start.tv_usec)*1e-6;
    printf("소수 개수: %d개\n실행 시간: %.4f초\n---\n", cnt, elapsed);

    /*
     * Task 1
     *
     * GROUP개의 스레드를 생성하고 각 스레드를 (논리)코어에 분산해서 할당한다.
     * 여러 개의 스레드를 생성하면 운영체제는 각 스레드를 코어에 분산시켜 실행한다.
     * 결과적으로 병렬 계산이 이루어져 순차방식보다 빠르게 계산할 수 있다.
     */
    gettimeofday(&start, NULL);
    printf("순차 계산...\n");

    gettimeofday(&end, NULL);
    elapsed = (double)(end.tv_sec - start.tv_sec)+(double)(end.tv_usec - start.tv_usec)*1e-6;
    printf("소수 개수 %d개\n실행 시간: %.4f초\n---\n", count, elapsed);

    /*
     * Task 2
     *
     * (논리)코어의 개수 만큼 스레드를 생성하고 각 GROUP을 스레드에 분산해서 할당한다.
     * OpenMP는 (논리)코어의 수 만큼 스레드를 생성하고 for 루프를 스레드에 분산하여 할당한다.
     * 운영체제는 각 스레드를 코어에 분산시켜 실행하므로 병렬 계산이 이루어진다.
     */
    gettimeofday(&start, NULL);
    printf("병렬 계산 (OpenMP)...\n");
    
    gettimeofday(&end, NULL);
    elapsed = (double)(end.tv_sec - start.tv_sec)+(double)(end.tv_usec - start.tv_usec)*1e-6;
    printf("소수 개수 %d개\n실행 시간: %.4f초\n---\n", count, elapsed);

    return 0;
}
