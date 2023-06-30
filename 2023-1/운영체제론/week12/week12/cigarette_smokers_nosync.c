/*
 * Copyright 2021, 2022, 2023. Heekuck Oh, all rights reserved
 * 이 프로그램은 한양대학교 ERICA 소프트웨어학부 재학생을 위한 교육용으로 제작되었다.
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <pthread.h>
#include <fcntl.h>           /* For O_* constants */
#include <sys/stat.h>        /* For mode constants */
#include <semaphore.h>

/*
 * 담배를 말아서 피우려면 필요한 세 가지 재료를 나타내는 문자열
 */
#define TABACCO "\e[0;32m연초\e[0m"
#define PAPER "\e[0;34m종이\e[0m"
#define MATCH "\e[0;31m성냥\e[0m"

/*
 * 흡연자 문제에서 사용하는 네 가지 세마포
 */
sem_t *tabacco, *paper, *matches, *done;

/*
 * 말린 담배잎을 잘게 썰어 놓은 일명 연초만 가지고 있는 흡연자
 */
void *tabacco_smoker(void *arg)
{
    while (true) {
        /*
         * 담배를 피운다.
         */
        printf(TABACCO" 흡연자\n");
        /*
         * 다 피웠음을 에이전트에게 알린다.
         */
        sem_post(done);
    }
}

/*
 * 연초를 말 수 있는 종이만 가지고 있는 흡연자
 */
void *paper_smoker(void *arg)
{
    while (true) {
        /*
         * 담배를 피운다.
         */
        printf(PAPER" 흡연자\n");
        /*
         * 다 피웠음을 에이전트에게 알린다.
         */
        sem_post(done);
    }
}

/*
 * 성냥만 가지고 있는 흡연자
 */
void *matches_smoker(void *arg)
{
    while (true) {
        /*
         * 담배를 피운다.
         */
        printf(MATCH" 흡연자\n");
        /*
         * 다 피웠음을 에이전트에게 알린다.
         */
        sem_post(done);
    }
}

/*
 * 연초, 종이, 성냥을 무한히 생산할 수 있는 에이전트
 * 임의로 두 가지만 생산해서 나머지를 가지고 있는 흡연자가 담배를 만들어 피울 수 있게 한다.
 * 이 과정을 무한 반복한다.
 */
void *agent(void *arg)
{
    int turn;
    
    srand(202305);
    while (true) {
        /*
         * 임의로 두 가지만 생산해서 나머지를 가진 흡연자가 피울 수 있게 한다.
         */
        turn = rand() % 6;
        switch (turn) {
            case 0:
                printf(TABACCO", "PAPER" -> ");
                sem_post(tabacco);
                sem_post(paper);
                break;
            case 1:
                printf(PAPER", "TABACCO" -> ");
                sem_post(paper);
                sem_post(tabacco);
                break;
            case 2:
                printf(PAPER", "MATCH" -> ");
                sem_post(paper);
                sem_post(matches);
                break;
            case 3:
                printf(MATCH", "PAPER" -> ");
                sem_post(matches);
                sem_post(paper);
                break;
            case 4:
                printf(TABACCO", "MATCH" -> ");
                sem_post(tabacco);
                sem_post(matches);
                break;
            case 5:
                printf(MATCH", "TABACCO" -> ");
                sem_post(matches);
                sem_post(tabacco);
                break;
            default:
                ;
        }
        /*
         * 흡연자가 담배를 다 피울 때까지 기다린다.
         */
        sem_wait(done);
    }
}

/*
 * 메인 함수는 세마포를 초기화하고 세 개의 흡연자 스레드와 에이전트 스레드를 생성한다.
 * 생성된 스레드가 일을 할 동안 1초 동안 기다렸다가 모든 스레드를 철회하고 종료한다.
 */
int main(void)
{
    pthread_t tabacco_id, paper_id, matches_id, agent_id;

    /*
     * 세마포를 초기화 한다. 다만 오류 검사는 생략한다.
     */
    tabacco = sem_open("tabacco", O_CREAT, 0600, 0);
    paper = sem_open("paper", O_CREAT, 0600, 0);
    matches = sem_open("matches", O_CREAT, 0600, 0);
    done = sem_open("done", O_CREAT, 0600, 0);
    /*
     * 스레드를 생성한다. 다만 오류 검사는 생략한다.
     */
    pthread_create(&tabacco_id, NULL, tabacco_smoker, NULL);
    pthread_create(&paper_id, NULL, paper_smoker, NULL);
    pthread_create(&matches_id, NULL, matches_smoker, NULL);
    pthread_create(&agent_id, NULL, agent, NULL);
    /*
     * 스레드가 실행할 동안 1초 기다린다.
     */
    sleep(1);
    /*
     * 스레드를 모두 철회한다.
     */
    pthread_cancel(tabacco_id);
    pthread_cancel(paper_id);
    pthread_cancel(matches_id);
    pthread_cancel(agent_id);
    /*
     * 세마포를 모두 지우고 정리한다.
     */
    sem_unlink("tabacco");
    sem_unlink("paper");
    sem_unlink("matches");
    sem_unlink("done");
    /*
     * 스레드가 조인될 때까지 기다린다.
     */
    pthread_join(tabacco_id, NULL);
    pthread_join(paper_id, NULL);
    pthread_join(matches_id, NULL);
    pthread_join(agent_id, NULL);
    
    return 0;
}
