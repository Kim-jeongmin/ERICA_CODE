/*
 * Copyright 2022. Heekuck Oh, all rights reserved
 * 이 프로그램은 한양대학교 ERICA 소프트웨어학부 재학생을 위한 교육용으로 제작되었습니다.
 */
#include <stdlib.h>
#include "pthread_pool.h"

/*
 * 풀에 있는 일꾼(일벌) 스레드가 수행할 함수이다.
 * FIFO 대기열에서 기다리고 있는 작업을 하나씩 꺼내서 실행한다.
 */
static void *worker(void *param)
{
    // 여기를 완성하세요
    pthread_pool_t *pool = (pthread_pool_t *) param; // 스레드풀을 받는다.
    task_t work; // 작업을 꺼내기 위한 구조체

    // 스레드풀이 종료될 때까지 무한히 반복한다.
    while(1){
      // 공유 변수 접근을 위해 lock
      pthread_mutex_lock(&(pool->mutex));

      // 대기열에 작업이 없으면 새 작업이 들어올 때까지 기다린다
      while((pool->q_len) == 0 && (pool->running)){
        pthread_cond_wait(&(pool->empty), &(pool->mutex));
      }

      // 스레드풀이 종료되면 반복을 나간다.
      if(!(pool->running) || (pool->q_len) == 0) break;

      // 대기열에서 작업을 꺼낸다.
      work.function = pool->q[pool->q_front].function;
      work.param = pool->q[pool->q_front].param;

      // 대기열 정보와 다음 작업될 위치를 업데이트 해준다.
      (pool->q_front)++;
      if((pool->q_front) == (pool->q_size)) pool->q_front = 0;
      (pool->q_len)--;

      // 대기열에 작업을 사용했으니 full 조건 변수를 깨워준다.
      pthread_cond_signal(&(pool->full));

      // lock을 해제한다.
      pthread_mutex_unlock(&(pool->mutex));

      // 작업을 수행합니다.
      (*(work.function))(work.param);
    }

    // 일꾼 스레드의 수를 하나 줄여줍니다.
    (pool->bee_size)--;

    // lock해제 없이 반복문을 탈출할 수 있으니 lock을 해제한다.
    pthread_mutex_unlock(&(pool->mutex));

    // 스레드를 종료합니다.
    pthread_exit(NULL);
    return NULL;
}

/*
 * 스레드풀을 초기화한다. 성공하면 POOL_SUCCESS를, 실패하면 POOL_FAIL을 리턴한다.
 * bee_size는 일꾼(일벌) 스레드의 갯수이고, queue_size는 작업 대기열의 크기이다.
 * 대기열의 크기 queue_size가 최소한 일꾼의 수 bee_size보다 크거나 같게 만든다.
 */
int pthread_pool_init(pthread_pool_t *pool, size_t bee_size, size_t queue_size)
{
    // 여기를 완성하세요
    // bee_size가 POOL_MAXBSIZE를 넘거나, queue_size가 POOL_MAXQSIZE를 넘으면 POOL_FAIL
    if(queue_size > POOL_MAXQSIZE || bee_size > POOL_MAXBSIZE) return POOL_FAIL;

    // 대기열로 사용할 원형 버퍼의 크기가 일꾼 스레드의 수보다 작으면 효율을 극대화할 수 없다.
    // 사용자가 요청한 queue_size가 최소한 bee_size 되도록 자동으로 상향 조정한다.
    if(bee_size > queue_size) queue_size = bee_size;

    // 함수는 스레드풀을 초기화한다.
    // 우선 사용자가 요청한 일꾼 스레드와 대기열에 필요한 공간을 할당한다.
    pool->q = (task_t *)malloc(sizeof(task_t)*queue_size);
    pool->bee = (pthread_t *)malloc(sizeof(pthread_t)*bee_size);

    // 변수를 초기화한다.
    pool->running = true;
    pool->bee_size = bee_size;
    pool->q_size = queue_size;
    pool->q_front = 0;
    pool->q_len = 0;

    // 일꾼 스레드의 동기화를 위해 사용할 상호배타 락과 조건변수를 초기화한다.
    pthread_mutex_init(&(pool->mutex), NULL);
    pthread_cond_init(&(pool->full), NULL);
    pthread_cond_init(&(pool->empty), NULL);

    // 마지막 단계에서는 일꾼 스레드를 생성하여 각 스레드가 worker() 함수를 실행하게 한다.
    for(int i = 0; i < bee_size; i++) {
        if(pthread_create((pool->bee + i), NULL, worker, pool) != 0) {
          // 일꾼 스레드 생성에 실패한다면 모두 반납하고 종료한다.
          pthread_pool_shutdown(pool);
          return POOL_FAIL;
        }
    }
    // 성공하면 POOL_SUCCESS를 리턴한다.
    return POOL_SUCCESS;
}

/*
 * 스레드풀에서 실행시킬 함수와 인자의 주소를 넘겨주며 작업을 요청한다.
 * 스레드풀의 대기열이 꽉 찬 상황에서 flag이 POOL_NOWAIT이면 즉시 POOL_FULL을 리턴한다.
 * POOL_WAIT이면 대기열에 빈 자리가 나올 때까지 기다렸다가 넣고 나온다.
 * 작업 요청이 성공하면 POOL_SUCCESS를 리턴한다.
 */
int pthread_pool_submit(pthread_pool_t *pool, void (*f)(void *p), void *p, int flag)
{
    // 여기를 완성하세요
    // 공유 변수 접근을 위해 lock
    pthread_mutex_lock(&(pool->mutex));

    // 대기열이 꽉 찬 상황
    if((pool->q_len) == (pool->q_size)){
      // 대기열이 꽉 찬 상황에서 POOL_NOWAIT이면 기다리지 않고 나온다.
      if(flag == POOL_NOWAIT){
        pthread_mutex_unlock(&(pool->mutex));
        return POOL_FULL;
      } else{ // POOL_WAIT이면 대기열에 빈 자리가 나올 때까지 기다린다.
        pthread_cond_wait(&(pool->full), &(pool->mutex));
      }
    }

    // 사용자가 요청한 작업을 대기열에 넣는다
    pool->q[(pool->q_len + pool->q_front) % (pool->q_size)].function = f;
    pool->q[(pool->q_len + pool->q_front) % (pool->q_size)].param = p;

    // 대기열 정보를 업데이트 해준다.
    (pool->q_len)++;

    // 대기열에 작업을 제출했으니 empty 조건 변수를 깨워준다.
    pthread_cond_signal(&(pool->empty));

    // lock을 해제한다.
    pthread_mutex_unlock(&(pool->mutex));

    // POOL_SUCCESS를 리턴한다
    return POOL_SUCCESS;
}

/*
 * 모든 일꾼 스레드를 종료하고 스레드풀에 할당된 자원을 모두 제거(반납)한다.
 * 락을 소유한 스레드를 중간에 철회하면 교착상태가 발생할 수 있으므로 주의한다.
 * 부모 스레드는 종료된 일꾼 스레드와 조인한 후에 할당된 메모리를 반납한다.
 * 종료가 완료되면 POOL_SUCCESS를 리턴한다.
 */
int pthread_pool_shutdown(pthread_pool_t *pool)
{
    // 여기를 완성하세요
    // 모든 일꾼 스레드를 종료시키고 스레드풀에 할당된 자원을 반납한다.
    pool -> running = false;
    pthread_cond_broadcast(&(pool->empty));
    pthread_cond_broadcast(&(pool->full));
    pthread_mutex_unlock(&(pool->mutex));

    // 부모 스레드는 종료된 일꾼 스레드와 조인한 후에 자원을 반납한다.
    for(int i = 0; i < (pool->bee_size); i++) {
        pthread_join((pool->bee[i]), NULL);
    }

    // 사용한 뮤텍스락과 조건 변수들을 소멸시킨다.
    pthread_mutex_destroy(&(pool->mutex));
    pthread_cond_destroy(&(pool->empty));
    pthread_cond_destroy(&(pool->full));

    // 일꾼 스레드와 원형 버퍼에 할당했던 공간을 해제한다.
    free(pool->q);
    free(pool->bee);

    // 종료가 완료되면 POOL_SUCCESS를 리턴한다.
    return POOL_SUCCESS;
}
