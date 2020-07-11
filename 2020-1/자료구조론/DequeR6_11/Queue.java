package DequeR6_11;

public interface Queue<E> {

	public int size();
	public boolean isEmpty();
	public void enqueue(E element);
	public E front(); 
	public abstract E back();
	public abstract E dequeue();


}
