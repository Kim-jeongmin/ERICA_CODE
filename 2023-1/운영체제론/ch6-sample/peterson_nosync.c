/*
 * Copyright 2021-2023. Heekuck Oh, all rights reserved
 * 이 프로그램은 한양대학교 ERICA 컴퓨터학부 재학생을 위해 교육용으로 제작되었다.
 */
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <pthread.h>

/*
 * alive 값이 false가 될 때까지 스레드 내의 루프가 무한히 반복된다.
 */
bool alive = true;
/*
 * 두 스레드가 임계구역에 동기화 없이 들어간다.
 */
void *worker(void *arg)
{
    int i = *(int *)arg;
    
    while (alive) {
        /*
         * 임계구역 시작: A 또는 B 문자를 한 줄에 40개씩 10줄 출력한다.
         */
        for (int k = 0; k < 400; ++k) {
            printf("%c", 'A'+i);
            if ((k+1) % 40 == 0)
                printf("\n");
        }
        /*
         * 임계구역 종료
         */
    }
    pthread_exit(NULL);
}

int main(void)
{
    pthread_t tid[2];
    int id[2] = {0,1};
    struct timespec req;
    /*
     * 두 개의 자식 스레드를 생성한다.
     */
    pthread_create(tid, NULL, worker, id);
    pthread_create(tid+1, NULL, worker, id+1);
    /*
     * 스레드가 출력하는 동안 1 마이크로초 쉰다.
     * 이 시간으로 스레드의 출력량을 조절한다.
     */
    req.tv_sec = 0;
    req.tv_nsec = 1000000L;
    nanosleep(&req, NULL);
    /*
     * 스레드가 자연스럽게 무한 루프를 빠져나올 수 있게 한다.
     */
    alive = false;
    /*
     * 자식 스레드가 종료될 때까지 기다린다.
     */
    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);
    /*
     * 메인함수를 종료한다.
     */
    return 0;
}
