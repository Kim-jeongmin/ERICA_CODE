import java.util.Scanner;
class Main {
  public static void main(String[] args) {
  System.out.print("Please enter a sentence:");
	Scanner scan = new Scanner(System.in);
  //여기에 코드를 입력하세요
  int sum=0;
  String a;
  a=scan.nextLine();
  for (int i = 0; i < a.length(); i++) {
    if(a.charAt(i)!=32) sum+=1;
  }
  System.out.print(sum);
  }
}