package linked_list;



public class Main {



public static void main(String[] args) {

// TODO Auto-generated method stub

/* SinglyLinkedList 필수 operation test */

boolean flag = true;



SinglyLinkedList sl = new SinglyLinkedList();



if (sl.getFirst() != -1) flag = false;

System.out.println(sl.getFirst()); // -1

if (sl.getLast() != -1) flag = false;

System.out.println(sl.getLast()); // -1



sl.addFirst(5);

sl.addFirst(4);

sl.addFirst(3);

sl.addFirst(2);

sl.addFirst(1);



if (sl.getFirst() != 1) flag = false;

System.out.println(sl.getFirst()); // 1

if (sl.getLast() != 5) flag = false;

System.out.println(sl.getLast()); // 5



sl.addLast(6);

sl.addLast(7);

sl.addLast(8);

sl.addLast(9);

sl.addLast(10);



if (sl.getFirst() != 1) flag = false;

System.out.println(sl.getFirst()); // 1

if (sl.getLast() != 10) flag = false;

System.out.println(sl.getLast()); // 10



if (flag) {

System.out.println("이 문구가 보이면 필수 SinglyLinkedList operation 구현에 성공한 것 입니다.");

} else {

System.out.println("이 문구가 보이면 필수 SinglyLinkedList operation 구현에 실패한 것 입니다.");

}



/* DoublyLinkedList 필수 operation test */

flag = true;

DoublyLinkedList dl = new DoublyLinkedList();



if (dl.getFirst() != -1) flag = false;

System.out.println(dl.getFirst()); // -1

if (dl.getLast() != -1) flag = false;

System.out.println(dl.getLast()); // -1



dl.addFirst(5);

dl.addFirst(4);

dl.addFirst(3);

dl.addFirst(2);

dl.addFirst(1);



if (dl.getFirst() != 1) flag = false;

System.out.println(dl.getFirst()); // 1

if (dl.getLast() != 5) flag = false;

System.out.println(dl.getLast()); // 5



dl.addLast(6);

dl.addLast(7);

dl.addLast(8);

dl.addLast(9);

dl.addLast(10);



if (dl.getFirst() != 1) flag = false;

System.out.println(dl.getFirst()); // 1

if (dl.getLast() != 10) flag = false;

System.out.println(dl.getLast()); // 10



if (flag) {

System.out.println("이 문구가 보이면 필수 DoublyLinkedList operation 구현에 성공한 것 입니다.");

} else {

System.out.println("이 문구가 보이면 필수 DoublyLinkedList operation 구현에 실패한 것 입니다.");

}



/* 

* SinglyLinkedList 전체 operation test

*  - 여기는 구현 성공 여부를 가르쳐 주지 않습니다.

*  - 예제 출력을 주석으로 달아놓았으니 참고하시기 바랍니다. 

*/



System.out.println(sl.removeFirst()); // 1

System.out.println(sl.removeFirst()); // 2

System.out.println(sl.removeFirst()); // 3

System.out.println(sl.removeFirst()); // 4

System.out.println(sl.removeFirst()); // 5

System.out.println(sl.removeFirst()); // 6

System.out.println(sl.removeFirst()); // 7

System.out.println(sl.removeFirst()); // 8

System.out.println(sl.removeFirst()); // 9





System.out.println(sl.getFirst()); // -1

System.out.println(sl.getLast()); // -1



sl.printList(); // 



sl.addFirst(1);

sl.addFirst(3);

sl.addFirst(5);

sl.addFirst(7);

sl.addFirst(9);

sl.printList(); // 9 7 5 3 1 



/* 

* DoublyLinkedList 전체 operation test

*  - 여기는 구현 성공 여부를 가르쳐 주지 않습니다.

*  - 예제 출력을 주석으로 달아놓았으니 참고하시기 바랍니다. 

*/



System.out.println(dl.removeFirst()); // 1

System.out.println(dl.removeFirst()); // 2

System.out.println(dl.removeFirst()); // 3

System.out.println(dl.removeFirst()); // 4

System.out.println(dl.removeFirst()); // 5

System.out.println(dl.removeLast()); // 10

System.out.println(dl.removeLast()); // 9

System.out.println(dl.removeLast()); // 8

System.out.println(dl.removeLast()); // 7



System.out.println(dl.getFirst()); // -1

System.out.println(dl.getLast()); // -1



dl.printList(); //



dl.addFirst(1);

dl.addFirst(2);

dl.addFirst(3);

dl.addFirst(4);

dl.addFirst(5);

dl.addLast(6);

dl.addLast(7);

dl.addLast(8);

dl.addLast(9);

dl.addLast(10);

dl.printList(); // 5 4 3 2 1 6 7 8 9 10

}



}