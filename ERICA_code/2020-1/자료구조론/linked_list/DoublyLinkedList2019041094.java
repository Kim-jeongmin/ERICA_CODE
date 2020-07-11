package linked_list;



public class DoublyLinkedList2019041094 {



/*

* [Class] Node

*  1) 개요

*   - DoublyLinkedList의 data를 담는 노드

*   - 각 노드는 이전 및 다음 노드를 가리키고 있어야 함

*   - data type은 정수라고 가정

*  2) 필수 operation

*   - 생성자

*   - getData(): 현재 노드가 가지고 있는 data를 반환하는 함수

*   - getNext(): 현재 노드가 가리키고 있는 다음 Node를 반환하는 함수

*   - getPrev(): 현재 노드가 가리키고 있는 이전 Node를 반환하는 함수

*   - setNext(): 현재 노드의 다음을 가리키게 하는 Node를 설정하는 함수

*   - setPrev(): 현재 노드의 이전을 가리키게 하는 Node를 설정하는 함수

*/



private static class Node {

private int data; // Node에서 저장하는 data

private Node next; // Node가 가리키고 있는 다음 노드

private Node prev; // Node가 가리키고 있는 이전 노드



/* [필수] 생성자 */

public Node(int d) {

	data = d;
	next = null;
	prev = null;

}



/* [필수] getData() */

public int getData() {

	return this.data;

}



/* [필수] getNext() */

public Node getNext() {

	return this.next;

}



/* [필수] getPrev() */

public Node getPrev() {

	return this.prev;

}



/* [필수] setNext() */

public void setNext(Node n) {

	this.next = n;

}



/* [필수] setPrev() */

public void setPrev(Node n) {

	this.prev = n;

}

}



/*

* [Class] DoublyLinkedList

*  1) 개요

*   - DoublyLinked의 첫 번째 노드를 가리키는 head와 마지막 노드를 가리키는 tail이 존재

*    -> head/tail을 dummy 노드로 만들어도 좋고, 데이터를 가진 노드로 만들어도 좋음

*   - data를 처음/마지막에 추가, 삭제하는 함수를 만들면 됨

*  2) 필수 operation

*   - getFirst(): linked list의 첫 번째 노드의 data를 반환하는 함수

*   - getLast(): linked list의 마지막 노드의 data를 반환하는 함수

*   - addFirst(): linked list의 맨 앞에 데이터를 추가

*   - addLast(): linked list의 맨 뒤에 데이터를 추가

*   - addBetween(): linked list의 두 노드 사이에 데이터를 추가

*  3) 추가 operation

*   - removeFirst(): linked list의 맨 앞의 노드를 삭제

*   - removeLast(): linked list의 맨 뒤의 노드를 삭제

*   - remove(): linked list의 특정 노드를 삭제

*   - printList(): linked list의 모든 데이터를 출력

*/



private Node head; // data의 첫 부분을 가리키는 노드

private Node tail; // data의 마지막 부분을 가리키는 노드

private int size; // 리스트의 크기를 출력하는 노드 (필요시 사용)



/* [필수] 생성자 */

public DoublyLinkedList() {

	head = new Node(-1);
	tail = new Node(-1);
	head.setNext(tail);
	tail.setPrev(head);
	size = 0;

}



/* 필요시 구현 */

public int size() {

	return size;

}



/* 필요시 구현 */

public boolean isEmpty() {

	return size == 0;

}



/* 

* [필수] getFirst()

*  - 노드가 아니라 데이터를 반환해야 함

*  - 만약 없을 경우 -1 리턴w

*/

public int getFirst() {

	return head.getNext().data;

}



/* [필수] getLast() */

public int getLast() {

	return tail.getPrev().data;

}



/* 

* [필수] addFirst()

*  - 데이터를 입력받아서 추가

*  - addBetween() operation 사용해서 구현

*/

public void addFirst(int data) {

addBetween(head,head.getNext(), data);

}



/* 

* [필수] addLast()

*  - addBetween() operation 사용해서 구현

*/

public void addLast(int data) {

addBetween(tail.getPrev(), tail, data);

}



/* 

* [필수] addBetween()

*  - Node prev와 next 사이에 data를 추가해야 함

*/

public void addBetween(Node prev, Node next, int data) {

	Node n = new Node(data);
	n.setNext(next);
	n.setPrev(prev);
	next.setPrev(n);
	prev.setNext(n);
	size++;

}



/*

* removeFirst()

*  - 첫 번째 노드를 삭제하고 data를 반환

*  - remove() operation 사용해서 구현

*  - 만약 없을 경우 -1 리턴

*/

public int removeFirst() {
	
	if(head.getNext() == null) return -1;
	return remove(head.next);

}



/* 

* removeLast()

*  - remove() operation 사용해서 구현

*/

public int removeLast() {

	if(tail.getPrev() == null) return -1;
	return remove(tail.prev);

}



/* 

* remove()

*  - Node n을 삭제

*  - n이 가지고 있는 데이터를 리턴

*/

public int remove(Node n) {
	
	if(isEmpty()) return -1;
	n.getNext().setPrev(n.getPrev());
	n.getPrev().setNext(n.getNext());
	size--;
	return n.data;

}



/*

* printList() : 재귀함수나 반복문으로 구현

*  - 형식은 다음과 같이 구현 (마지막 개행 포함)

*  > 1 2 3 4 5 

*/

public void printList() {
	
	Node n = head.getNext();

	for(int i=0;i<size;i++) {
		System.out.print(n.data + " ");
		n = n.getNext();
	}
	System.out.println();

}

}

