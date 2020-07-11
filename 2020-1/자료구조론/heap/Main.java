package heap;

public class Main {
    
    public static void heapSort(Heap h) {
        while (h.size() > 0) {
            System.out.print(h.remove());
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Heap h = new Heap();
        
        System.out.println(h.size());       // 0
        System.out.println(h.remove());     // -1
        
        h.add(5);
        h.preorder(h.getRoot());            // 5
        System.out.println();
        h.add(3);
        h.preorder(h.getRoot());            // 5 3
        System.out.println();
        h.add(7);
        h.preorder(h.getRoot());            // 7 3 5
        System.out.println();
        h.add(2);
        h.preorder(h.getRoot());            // 7 3 2 5
        System.out.println();
        h.add(8);
        h.preorder(h.getRoot());            // 8 7 2 3 5
        System.out.println();
        h.add(9);
        h.preorder(h.getRoot());            // 9 7 2 3 8 5
        System.out.println();
        h.add(10);
        h.preorder(h.getRoot());            // 10 7 2 3 9 5 8
        System.out.println();
        h.add(4);
        h.preorder(h.getRoot());            // 10 7 4 2 3 9 5 8
        System.out.println();
        h.add(1);
        h.preorder(h.getRoot());            // 10 7 4 2 1 3 9 5 8
        System.out.println();
        h.add(6);
        h.preorder(h.getRoot());            // 10 7 4 2 1 6 3 9 5 8
        System.out.println();
        h.inorder(h.getRoot());             // 2 4 1 7 3 6 10 5 9 8
        System.out.println();
        
        // 동일한 결과가 나와야 필수 operation 구현을 성공했다고 생각하시면 되겠습니다.
        
        heapSort(h);                        // 10 9 8 7 6 5 4 3 2 1
    }

}
