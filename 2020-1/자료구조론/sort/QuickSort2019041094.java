package sort;

import java.util.ArrayList;

public class QuickSort2019041094 {
    ArrayList<Integer> data;        // 최종 결과 list
    
    /*
     * [Class] QuickSort
     *   1) 개요
     *     - list에 가장 왼쪽 원소를 pivot으로 정해서 pivot보다 작은 부분을 왼쪽으로, 큰 부분을 오른쪽으로 쪼갬
     *     - 각 쪼갠 부분을 다시 quicksort로 정렬
     *   2) 필수 operation
     *     - partition(): pivot을 기준으로 쪼개주는 함수
     *     - quickSort(): partition으로 쪼개고 정렬하는 함수
     */
    public QuickSort2019041094(ArrayList<Integer> data) {
        quickSort(data, 0, data.size()-1);      // list data의 index 0~size-1 범위 내에 있는 데이터 정렬해라
        this.data = data;                       // 최종 결과
    }
    
    /*
     * [필수] partition(ArrayList<Integer> data, int start, int end)
     *  - list data의 [start, end] 범위에 있는 데이터들을 pivot을 기준으로 쪼개서 왼쪽 / 오른쪽으로 구분하는 함수
     *  - 최종적으로 pivot의 위치를 return
     *    1) 제일 왼쪽 index를 pivot으로 설정
     *    2) pivot보다 작은 애들을 왼쪽으로, 큰 애들을 오른쪽으로 구분함
     *    3) 최종적으로 pivot을 분리한 애들 사이로 옮김 (해당 pivot은 정렬됨)
     */
    private int partition(ArrayList<Integer> data, int start, int end) {
        // 구현
    	int pivot = data.get(start);
    	int left = start+1;
    	int right = end;
    	while(left <= right) {
    		if(data.get(left) < pivot) {
    			left++;
    			continue;
    		}
    		if(data.get(right) > pivot) {
    			right--;
    			continue;
    		} 
   			int temp = data.get(right);
   			data.set(right, data.get(left));
   			data.set(left, temp);	
    	}
    	data.set(start, data.get(right));
    	data.set(right, pivot);
    	return right;
    	
    }
    
    /*
     * [필수-빈칸채우기/? 부분을 채우시오] quickSort(ArrayList<Integer> data, int start, int end)
     *  - 현재 list인 data의 [start, end] 범위를 정렬해주는 함수
     *    1) data를 partition 함수에 의해서 세 부분으로 나눔
     *    2) pivot 왼쪽 범위 / pivot(정렬됨) / pivot 오른쪽 범위
     *    3) 왼쪽 범위와 오른쪽 범위에 대해서 quickSort를 다시 실행시킴
     */
    private void quickSort(ArrayList<Integer> data, int start, int end) {
        if (start >= end) {
            return;
        }
        
        int idx = partition(data, start, end);         // 1) 채우시오, idx = pivot의 위치가 됨
        quickSort(data, start, idx);                   // 2) 채우시오, pivot 왼쪽 범위
        quickSort(data, idx + 1, end);                   // 3) 채우시오, pivot 오른쪽 범위
    }
}
