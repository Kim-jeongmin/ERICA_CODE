import java.io.*;

public class DoublyLinkedList {
	Node head;
	Node tail;
	class Node{
		int data;
		Node prev;
		Node next;
		Node(int d){data = d;}
	}
	public void push(int new_data) {
		Node new_Node = new Node(new_data);
		new_Node.next = head;
		new_Node.prev = null;
		if(head!=null) head.prev = new_Node;
		head = new_Node;
		if(head.next == null) tail = head;
	}
	public void middleElement() {
		Node temp1 = head;
		Node temp2 = tail;
		if(temp1 == null || temp2 == null) System.out.println("No node in linked list");
		else if(temp1.next == null || temp2.prev==null) System.out.println(temp1.data);
		else {
			while(temp1.next != null && temp2.prev != null) {
				if(temp1.equals(temp2) || temp1.equals(temp2.prev)) {
					System.out.println(temp1.data);
					break;
				}
				temp2 = temp2.prev;
				temp1 = temp1.next;
			}
		}
	}
	public static void main(String[] args) {
		DoublyLinkedList dll = new DoublyLinkedList();
		dll.push(4);
		dll.push(2);
		dll.push(7);
		dll.push(11);
		dll.middleElement();
	}
}
