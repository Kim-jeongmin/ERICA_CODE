package binary_search_tree;



public class Main {



  public static void main(String[] args) {

    // TODO Auto-generated method stub

    BinarySearchTree bst = new BinarySearchTree();

     

    bst.preorder(bst.getRoot());  // 

    System.out.println();

     

    bst.add(44);

    bst.add(78);

    bst.add(50);

     

    bst.preorder(bst.getRoot());  // 44 78 50 

    System.out.println();

    bst.inorder(bst.getRoot());   // 44 50 78 

    System.out.println();

     

    bst.add(48);

    bst.add(88);

    bst.add(20);

     

    bst.preorder(bst.getRoot());  // 44 20 78 50 48 88 

    System.out.println();

    bst.inorder(bst.getRoot());   // 20 44 48 50 78 88 

    System.out.println();

     

    bst.add(10);

    bst.add(32);

    bst.add(5);

     

    bst.preorder(bst.getRoot());  // 44 20 10 5 32 78 50 48 88 

    System.out.println();

    bst.inorder(bst.getRoot());   // 5 10 20 32 44 48 50 78 88 

    System.out.println();

     

    bst.add(15);

    bst.add(62);

     

    bst.preorder(bst.getRoot());  // 44 20 10 5 15 32 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());   // 5 10 15 20 32 44 48 50 62 78 88

    System.out.println();

     

    bst.add(36);

    bst.add(30);

    bst.preorder(bst.getRoot());  // 44 20 10 5 15 32 30 36 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());   // 5 10 15 20 30 32 36 44 48 50 62 78 88  

    System.out.println();

     

    // 동일한 결과가 나와야 필수 operation 구현을 성공했다고 생각하시면 되겠습니다.

     

    bst.add(17);

    bst.add(16);

    bst.add(14);

     

    // post order

    bst.postorder(bst.getRoot());  // 5 14 16 17 15 10 30 36 32 20 48 62 50 88 78 44 

    System.out.println();

     

    // 삭제할 node가 없을 때

    System.out.println(bst.remove(1));   // -1

    System.out.println(bst.remove(40));   // -1

    System.out.println(bst.remove(45));   // -1

    System.out.println(bst.remove(10000)); // -1

     

    // leaf node 삭제 1

    System.out.println(bst.remove(36));   // 36

    bst.preorder(bst.getRoot());      // 44 20 10 5 15 14 17 16 32 30 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());       // 5 10 14 15 16 17 20 30 32 44 48 50 62 78 88 

    System.out.println();

     

    // leaf node 삭제 2

    System.out.println(bst.remove(5));   // 5

    bst.preorder(bst.getRoot());      // 44 20 10 15 14 17 16 32 30 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());       // 10 14 15 16 17 20 30 32 44 48 50 62 78 88 

    System.out.println();

     

    // root 삭제

    System.out.println(bst.remove(44));   // 44

    bst.preorder(bst.getRoot());      // 32 20 10 15 14 17 16 30 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());       // 10 14 15 16 17 20 30 32 48 50 62 78 88 

    System.out.println();

     

    // internal node 삭제 1 (왼쪽)

    System.out.println(bst.remove(20));   // 20

    bst.preorder(bst.getRoot());      // 32 17 10 15 14 16 30 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());       // 10 14 15 16 17 30 32 48 50 62 78 88 

    System.out.println();

     

    // internal node 삭제 2 (오른쪽)

    System.out.println(bst.remove(10));   // 10

    bst.preorder(bst.getRoot());      // 32 17 14 15 16 30 78 50 48 62 88 

    System.out.println();

    bst.inorder(bst.getRoot());       // 14 15 16 17 30 32 48 50 62 78 88 

    System.out.println();

  }



}