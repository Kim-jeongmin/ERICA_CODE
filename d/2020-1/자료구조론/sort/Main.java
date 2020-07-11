package sort;

import java.util.ArrayList;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        
        ArrayList<Integer> data1 = new ArrayList<>(Arrays.asList(85, 24, 63, 45, 17, 31, 96, 50, 1, 15, 38, 9, 99, 51, 77, 60));
        MergeSort ms = new MergeSort(data1);
        for (int i = 0; i < ms.data.size(); i++) {
            System.out.print(ms.data.get(i));
            System.out.print(" ");
        }
        System.out.println();
        // 1 9 15 17 24 31 38 45 50 51 60 63 77 85 96 99 
        
        ArrayList<Integer> data2 = new ArrayList<>(Arrays.asList(85, 24, 63, 45, 17, 31, 96, 50, 1, 15, 38, 9, 99, 51, 77, 60));
        QuickSort qs = new QuickSort(data2);
        for (int i = 0; i < qs.data.size(); i++) {
            System.out.print(qs.data.get(i));
            System.out.print(" ");
        }
        System.out.println();
        // 1 9 15 17 24 31 38 45 50 51 60 63 77 85 96 99 
    }

}
