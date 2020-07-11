import java.util.Scanner; 

class Main {
  public static void main(String[] args) {
    String str = "";  // 입력받는 문자열
    String outputStr = ""; //출력 문자열 
    Scanner scan = new Scanner(System.in);
    str = scan.next(); // 문자열 입력받기 
    outputStr += str.charAt(2);
    outputStr += str.charAt(1);
    outputStr += str.charAt(0);
    // 여기에 코드를 입력하세요. 
    
    
    System.out.println(outputStr);
  }
}