package DequeR6_11;
import java.util.Deque;

public class DequeQueue<E> implements Queue<E> {
	private Deque<E> deque = new Deque<>();
	public DequeQueue() { }
	public int size() {return deque.size();}
	public boolean isEmpty() {return deque.isEmpty();}
	public void enqueue(E element) {deque.addFirst(element);}
	public E front() {return deque.peekFirst();}
	public E back() {return deque.peekLast();}
	public E dequeue() {return deque.removeLast();}
}
