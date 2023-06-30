// 2023/06/04 컴퓨터학부 2019041094 김정민 스레드풀 구현
#include "pthread_pool.h"
#include <stdlib.h>

static void *worker(void *param)
{
    pthread_pool_t *pool = (pthread_pool_t *)param;
    
    while (1) {
        pthread_mutex_lock(&(pool->mutex));
        
        // 대기열에 작업이 없는 경우
        while (pool->q_len == 0 && pool->running) {
            pthread_cond_wait(&(pool->empty), &(pool->mutex));
        }
        
        // 스레드풀 종료 조건 확인
        if (!(pool->running) || (pool->q_len) == 0) {
            pthread_mutex_unlock(&(pool->mutex));
            pthread_exit(NULL);
	    break;
        }
        
        // 작업을 꺼내서 실행
        task_t task = pool->q[pool->q_front];
        pool->q_front = (pool->q_front + 1) % pool->q_size;
        pool->q_len--;

	// 대기열에 작업을 사용했으니 full 조건 변수를 깨워준다.
      	pthread_cond_signal(&(pool->full));
        
        pthread_mutex_unlock(&(pool->mutex));
        
        (task.function)(task.param);
    }

    (pool->bee_size)--;
    
    pthread_mutex_unlock(&(pool->mutex));

    // 스레드를 종료합니다.
    pthread_exit(NULL);
    
    return NULL;
}

int pthread_pool_init(pthread_pool_t *pool, size_t bee_size, size_t queue_size)
{
    if (bee_size > POOL_MAXBSIZE || queue_size > POOL_MAXQSIZE) {
        return POOL_FAIL;
    }
    
    // 대기열로 사용할 원형 버퍼의 크기가 일꾼 스레드의 수보다 작으면 효율을 극대화할 수 없다.
    // 사용자가 요청한 queue_size가 최소한 bee_size 되도록 자동으로 상향 조정한다.
    if (bee_size > queue_size) queue_size = bee_size;

    // 스레드풀 정보 초기화
    pool->running = true;
    pool->q = (task_t *)malloc(queue_size * sizeof(task_t));
    pool->q_size = queue_size;
    pool->q_front = 0;
    pool->q_len = 0;
    pool->bee = (pthread_t *)malloc(bee_size * sizeof(pthread_t));
    pool->bee_size = bee_size;
    
    // 락과 조건변수 초기화
    pthread_mutex_init(&(pool->mutex), NULL);
    pthread_cond_init(&(pool->full), NULL);
    pthread_cond_init(&(pool->empty), NULL);
    
    // 일꾼 스레드 생성
    for (int i = 0; i < bee_size; i++) {
        if (pthread_create(&(pool->bee[i]), NULL, worker, pool) != 0) {
	    pthread_pool_shutdown(pool, POOL_DISCARD);
            return POOL_FAIL;
        }
     
    }
    
    return POOL_SUCCESS;
}

int pthread_pool_submit(pthread_pool_t *pool, void (*f)(void *p), void *p, int flag)
{
    pthread_mutex_lock(&(pool->mutex));
    
    // 대기열이 꽉 찬 경우
    if (pool->q_len == pool->q_size) {
        if (flag == POOL_NOWAIT) {
            pthread_mutex_unlock(&(pool->mutex));
            return POOL_FULL;
        } else {
        // 대기열이 꽉 차서 더 이상 작업을 넣을 수 없는 경우 대기
        //while (pool->q_len == pool->q_size) {
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

int pthread_pool_shutdown(pthread_pool_t *pool, int how)
{
    pthread_mutex_lock(&(pool->mutex));
    
    // how에 따라 작업을 다 끝낼지 말지 결정
    if (how == POOL_COMPLETE) {
        // 대기열이 비어질 때까지 대기
        while (pool->q_len > 0) {
            pthread_cond_wait(&(pool->full), &(pool->mutex));
        }
    } else if (how == POOL_DISCARD) {
        // 대기열 비우기
        pool->q_front = 0;
        pool->q_len = 0;
    }
    pool->running = false;
    pthread_cond_broadcast(&(pool->empty));
    pthread_cond_broadcast(&(pool->full));
    pthread_mutex_unlock(&(pool->mutex));
    
    for (int i = 0; i < pool->bee_size; i++) {
        pthread_join(pool->bee[i], NULL);
    }
    
    free(pool->q);
    free(pool->bee);
    
    pthread_mutex_destroy(&(pool->mutex));
    pthread_cond_destroy(&(pool->full));
    pthread_cond_destroy(&(pool->empty));
    
    return POOL_SUCCESS;
}

