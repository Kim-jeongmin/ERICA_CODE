package queue;



public class Main {



  public static void main(String[] args) {

    // TODO Auto-generated method stub

    boolean flag = true;

    char tmp;

     

    Queue q = new Queue();

     

    tmp = q.dequeue();

    if (tmp != '-') flag = false;

    System.out.println(tmp);        // -

    if (q.first() != '-') flag = false;

    System.out.println(q.first());     // -

     

    q.enqueue('5');

    q.enqueue('3');

     

    if (q.size() != 2) flag = false;

    System.out.println(q.size());      // 2

    tmp = q.dequeue();

    if (tmp != '5') flag = false;

    System.out.println(tmp);        // 5

    if (q.isEmpty() != false) flag = false;

    System.out.println(q.isEmpty());    // false

    tmp = q.dequeue();

    if (tmp != '3') flag = false;

    System.out.println(tmp);        // 3

    if (q.isEmpty() != true) flag = false;

    System.out.println(q.isEmpty());    // true

    tmp = q.dequeue();

    if (tmp != '-') flag = false;

    System.out.println(tmp);        // -

     

    q.enqueue('7');

    q.enqueue('9');

     

    if (q.first() != '7') flag = false;

    System.out.println(q.first());     // 7

     

    if (flag) {

      System.out.println("이 문구가 보이면 필수 Queue operation 구현에 성공한 것 입니다.");

    } else {

      System.out.println("이 문구가 보이면 필수 Queue operation 구현에 실패한 것 입니다.");

    }

     

    q.enqueue('4');

    q.enqueue('5');

    q.enqueue('0');

     

    q.dequeueAll();     // 7 9 4 5 0 

  }



}

