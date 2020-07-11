package sort;

import java.util.ArrayList;

public class MergeSort2019041094 {
    ArrayList<Integer> data;    // 최종 결과 List
    
    /*
     * [Class] MergeSort
     *   1) 개요
     *     - list를 항상 반으로 쪼개서 더 이상 쪼개지지 않을 때 까지 나눔
     *     - 제일 작게 나눴다면 merge하면서 정렬해 나감
     *     - 이전에 구현했던 queue를 사용하여 구현
     *   2) 필수 operation
     *     - merge(): 정렬된 원소를 가진 queue 2개를 합치는 함수
     *     - mergeSort(): 데이터를 반으로 쪼개고 merge를 부르는 함수
     */
    
    public MergeSort2019041094(ArrayList<Integer> data) { // data: 입력으로 들어온 list
        Queue q = new Queue();                  // Queue q: 최종 결과를 담을 queue
        for (int i = 0; i < data.size(); i++) {
            q.enqueue(data.get(i));             // 입력 값 옮기기 list->queue
        }
        mergeSort(q);                           // 현재 q에 있는 data를 정렬해라
        
        // 최종 결과 옮기기
        data.clear();
        while (!q.isEmpty()) {
            data.add(q.dequeue());              // 최종 결과 queue->list
        }
        this.data = data;                       // data를 통해서 최종 결과에 접근 가능 (Main에서 확인)
    }
    
    /*
     * [필수] merge(Queue q1, Queue q2, Queue result)
     *  - q1과 q2를 각각 오름차순으로 정렬된 상태로 result에 넣어주는 함수
     *    1) q1과 q2의 앞에서부터 더 작은 값을 result에 넣어줌
     *    2) 둘 중 하나가 다 끝났다면 나머지들을 다 넣어주면 됨
     */
    private void merge(Queue q1, Queue q2, Queue result) {
        // 구현
    	while(!q1.isEmpty() && !q2.isEmpty()) {
    		if(q1.first() > q2.first()) {
    			result.enqueue(q2.dequeue());
    		}
    		else {
    			result.enqueue(q1.dequeue());
    		}
    	}
    	while(q1.isEmpty() && !q2.isEmpty()) {
    		result.enqueue(q2.dequeue());
    	}
    	while(!q1.isEmpty() && q2.isEmpty()) {
    		result.enqueue(q1.dequeue());
    	}
    }
    
    /*
     * [필수-빈칸채우기/? 부분을 채우시오] mergeSort(Queue q)
     *  - 현재 q가 가지고 있는 원소를 정렬해주는 함수
     *    1) q를 두 부분으로 나눔 (각각을 q1, q2라고 가정)
     *    2) q의 데이터에 대해서, q1에 반만큼을 채우고 나머지를 q2에 채움
     *    3) q1과 q2에 대해서 각각 mergeSort를 실행시킴
     *       -> q1, q2는 각각 mergeSort에 의해서 정렬이 되어 돌아올 것임
     *    4) 정렬된 q1과 q2를 merge 함수를 통해서 합치며, 최종적으로 q에 다시 정렬시킴
     */
    private void mergeSort(Queue q) {
        int size = q.size();
        if (size < 2) {                 // size가 1이면 정렬할 필요가 없음
            return;
        }
        Queue q1 = new Queue();         // 1) q의 반만큼을 옮길 q1
        Queue q2 = new Queue();         // 1) q의 나머지 반을 옮길 q2
        while (q1.size() < size/2) {
            q1.enqueue(q.dequeue());    // 2) 반만큼 q1에 채움
        }
        while (!q.isEmpty()) {
            q2.enqueue(q.dequeue());    // 2) 나머지 반을 q2에 채움
        }
        mergeSort(q1);                   // 3) 채우시오
        mergeSort(q2);                   // 3) 채우시오
        merge(q1, q2, q);                 // 4) 채우시오 (merge 함수를 참고해서 변수에 뭐가 들어갈 지 맞춰서 넣으면 됨, hint: 결과는 q에 저장해야 함)
    }
}
