package stack;



public class Main {

   

  /* 

   * 4) 보너스 operation (괄호 체크)

   *   - 구현하지 않아도 A 받는데 문제 없음

   *   - 구현할 때 주석 풀고 구현하면 됨

   *   - 최종 구현에 실패하면 꼭 주석처리

   *   - checkMatching(): 문자열을 입력받아서 해당 문자열이 괄호가 제대로 닫혀있는 지를 확인해주는 함수 구현

   *   - 문자열은 괄호로만 이루어져있다고 가정

   *   - ex) (()()) >> True

   *   - ex2) (()(())()))() >> False

   */

  public static boolean checkMatching(String str) {

    Stack s = new Stack();

    for(int i=0;i<str.length();i++) {
    	if(str.charAt(i) == '(') {
    		s.push(str.charAt(i));
    	}
    	else {
    		if(s.top() == '(') s.pop();
    		else return false;
    	}
    }
    
    if(s.isEmpty()) return true;
    else return false;

  }



  public static void main(String[] args) {

    // TODO Auto-generated method stub

    /* Stack 필수 operation test */

    boolean flag = true;

    char tmp;

     

    Stack s = new Stack();

     

    if (s.top() != '-')

      flag = false;

    System.out.println(s.top());

    if (s.size() != 0)

      flag = false;

    System.out.println(s.size());

    tmp = s.pop();

    if (tmp != '-')

      flag = false;

    System.out.println(tmp);

     

    s.push('5');

    s.push('3');

     

    if (s.size() != 2)

      flag = false;

    System.out.println(s.size());

    tmp = s.pop();

    if (tmp != '3')

      flag = false;

    System.out.println(tmp);

    if (s.isEmpty() != false)

      flag = false;

    System.out.println(s.isEmpty());

    tmp = s.pop();

    if (tmp != '5')

      flag = false;

    System.out.println(tmp);

    if (s.isEmpty() != true)

      flag = false;

    System.out.println(s.isEmpty());

    tmp = s.pop();

    if (tmp != '-')

      flag = false;

    System.out.println(tmp);

     

    s.push('7');

    s.push('9');

     

    if (s.top() != '9')

      flag = false;

    System.out.println(s.top());

     

    s.push('4');

     

    if (s.size() != 3)

      flag = false;

    System.out.println(s.size());

    tmp = s.pop();

    if (tmp != '4')

      flag = false;

    System.out.println(tmp);

     

    s.push('6');

    s.push('8');

     

    tmp = s.pop();

    if (tmp != '8')

      flag = false;

    System.out.println(tmp);

     

    if (flag) {

      System.out.println("이 문구가 보이면 필수 Stack operation 구현에 성공한 것 입니다.");

    } else {

      System.out.println("이 문구가 보이면 필수 Stack operation 구현에 실패한 것 입니다.");

    }

     

    /*

     * Stack 전체 operation test

     * - 여기는 구현 성공 여부를 가르쳐 주지 않습니다.

     * - 예제 출력을 주석으로 달아놓았으니 참고하시기 바랍니다.

     */

     

    s.popAll();   // 6 9 7

     

    s.push('1');

    s.push('2');

     

    System.out.println(s.size());  // 2

     

    s.popAll();   // 2 1

    s.popAll();   // 

     

    System.out.println(s.size());  // 0

     

    // 구현 확인할 때 주석 풀고 확인하면 됨

    System.out.println(checkMatching("(())()"));                  // true

    System.out.println(checkMatching("((((())))())"));               // true

    System.out.println(checkMatching(")(()()())"));                 // false

    System.out.println(checkMatching("(((((()))))"));                // false

    System.out.println(checkMatching("()(())((()))()()(())((()))(())((((()))))")); // true

  }



}

