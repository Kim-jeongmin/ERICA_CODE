package heap;

import java.util.Stack;

public class Heap2019041094 {
    private static class Node {
        private int data;      // Node에서 저장하는 data
        private Node parent;    // 현재 Node의 부모를 가리킴
        private Node left;      // 현재 Node의 왼쪽 자식을 가리킴
        private Node right;     // 현재 Node의 오른쪽 자식을 가리킴
        
        /* [필수] 생성자 */
        public Node(int d) {
            parent = null;
            left = null;
            right = null;
            data = d;
        }
        
        /* [필수] getData() */
        public int getData() {
            return data;
        }
        
        /* [필수] getParent() */
        public Node getParent() {
            return parent;
        }
        
        /* [필수] getLeft() */
        public Node getLeft() {
            return left;
        }
        
        /* [필수] getRight() */
        public Node getRight() {
            return right;
        }
        
        /* [필수] setData() */
        public void setData(int data) {
            this.data = data;
        }
        
        /* [필수] setParent() */
        public void setParent(Node n) {
            parent = n;
        }
        
        /* [필수] setLeft() */
        public void setLeft(Node n) {
            left = n;
        }
        
        /* [필수] setRight() */
        public void setRight(Node n) {
            right = n;
        }
    }
    
    /*
     * [Class] Heap
     *   1) 개요
     *     - Tree의 맨 위를 가리키는 root가 있음
     *     - 데이터를 추가할 때는 heap의 가장 마지막 부분에 일단 추가함
     *     - 이후 swap 하면서 위치를 제대로 맞춤
     *   2) 필수 operation
     *     - size(): Heap의 크기를 나타내는 함수
     *     - getRoot(): Heap의 root를 반환하는 함수
     *     - add(): Heap에 data를 추가하는 함수
     *   3) 추가 operation
     *     - remove(): Heap의 특정 data를 삭제하는 함수
     *     - inorder(): inorder 방식으로 tree를 순회하는 함수
     *     - preorder(): preorder 방식으로 tree를 순회하는 함수
     */
    
    private Node root;      // Heap의 root
    private int size;       // Heap의 size
    Stack<Integer> s = new Stack<>();    // getNodeByIndex()에 사용 
    
    /* [필수] 생성자 */
    public Heap2019041094() {
        root = null;
        size = 0;
    }
    
    /*
     * [필수] size()
     *  - BST의 size를 리턴
     */
    public int size() {
        return size;
    }
    
    /*
     * [필수] getRoot()
     *  - BST의 root를 리턴
     */
    public Node getRoot() {
        return root;
    }
    
    /* [제공] getNodeByIndex()
     *   - heap의 index에 해당하는 node를 반환
     *   - ppt를 참고
     */
    public Node getNodeByIndex(int idx) {
        Node n = getRoot();
        
        s.clear();
        while (idx > 1) {
            s.push(idx % 2);    // 현재 element가 1이면 오른쪽, 0이면 왼쪽으로 이동
            idx /= 2;
        }
        // idx 있는 곳까지 이동
        while (!s.isEmpty()) {
            if (s.pop() == 1) {
                n = n.getRight();
            } else {
                n = n.getLeft();
            }
        }
        
        return n;
    }
    
    /*
     * [필수] add()
     *  - Heap에 값 추가
     *  - 일단 제일 마지막 노드에 추가
     *  - 추가할 데이터가 parent보다 크면 위쪽으로 swap을 재귀적으로 반복
     */
    public void add(int data) {
        // 구현
    	if(size > 0) {
    		Node temp = new Node(data);
    		Node n = getNodeByIndex(++size);
    		Node parent = getNodeByIndex(size/2);
    		n = temp;
    		n.setParent(parent);
    		if(size%2 == 0) parent.setLeft(n);
    		else parent.setRight(n);
    		swapUp(n);
    	}
    	else {
    		Node n = new Node(data);
    		root = n; size++;
    	}
    }
    
    /*
     * [필수] swapUp()
     *  - 현재 node의 값이 parent의 값보다 크면 서로 값 교체
     *  - swap했다면 재귀적으로 반복, 아니면 종료
     */
    public void swapUp(Node n) {  
    	if(n != getRoot() && n.getData() > n.getParent().getData()) {
        	int temp = n.data;
        	n.data = n.getParent().data;
        	n.getParent().data = temp;
        	swapUp(n.getParent());
        }
    }
    
    
    /*
     *  remove()
     *    - Heap의 root를 삭제하는 함수
     *      1) root와 heap의 마지막 index node의 data를 교환
     *      2) 교환 후 마지막 index에 해당하는 node 삭제
     *      3) 바뀐 root를 아래로 내려서 수정해야 함
     *    - data가 없으면 -1을 return
     */
    public int remove() {
        // 구현
    	if(size != 0) {
    		Node n = getNodeByIndex(size);
    		int temp = root.data;
    		root.data = n.data;
    		n.data = temp;
    		if(size > 1) {
    			if(size % 2 == 0) n.getParent().setLeft(null);
    			else n.getParent().setRight(null);
    		}
    		n.setParent(null);
    		swapDown(getRoot());
    		size--;
    		return temp;
    	}
    	else return -1;
    	
    	
    }
    
    /*
     * swapDown()
     *  - 현재 node의 값이 child의 값보다 작으면 교체
     *  - 자식이 여러개면 그 중 제일 큰 값과 교체해야 함
     *  - swap했다면 재귀적으로 반복, 아니면 종료
     */
    public void swapDown(Node n) {
        // 구현
    	if(n.getLeft() != null && n.getRight() != null) {
    		if(n.getLeft().getData() > n.getRight().getData()) {
    			int temp = n.data;
    			n.data = n.getLeft().data;
    			n.getLeft().data = temp;
    			swapDown(n.getLeft());
    		}
    		else {
    			int temp = n.data;
    			n.data = n.getRight().data;
    			n.getRight().data = temp;
    			swapDown(n.getRight());
    		}
    	}
    	else if(n.getLeft() == null && n.getRight() != null) {
    		int temp = n.data;
			n.data = n.getRight().data;
			n.getRight().data = temp;
			swapDown(n.getRight());
    	}
    	else if (n.getLeft() != null && n.getRight() == null) {
    		int temp = n.data;
			n.data = n.getLeft().data;
			n.getLeft().data = temp;
			swapDown(n.getLeft());
    	}
    }
    
    /*
     *  preorder()
     *    - Heap의 모든 데이터를 preorder 방식으로 출력
     *    - 출력 예시로 제공
     */
    public void preorder(Node n) {
        if (n != null) {
            System.out.print(n.getData());
            System.out.print(" ");
            preorder(n.getLeft());
            preorder(n.getRight());
        }
    }
    
    /*
     *  inorder()
     *    - Heap의 모든 데이터를 inorder 방식으로 출력
     *    - 출력 예시로 제공 (숫자가 정렬되어서 출력되는게 정상입니다)
     */
    public void inorder(Node n) {
        if (n != null) {
            inorder(n.getLeft());
            System.out.print(n.getData());
            System.out.print(" ");
            inorder(n.getRight());
        }
    }
    
    /*
     *  inorder()
     *    - Heap의 모든 데이터를 postorder 방식으로 출력
     *    - 출력 예시로 제공 (숫자가 정렬 안 되어있는게 정상입니다)
     */
    public void postorder(Node n) {
        if (n != null) {
            postorder(n.getLeft());
            postorder(n.getRight());
            System.out.print(n.getData());
            System.out.print(" ");
        }
    }
}

