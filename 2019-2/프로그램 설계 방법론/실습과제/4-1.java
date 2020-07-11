import java.util.Scanner;
class Main {
  public static void main(String[] args) {
  		double grade; // 평점
  		
  		// 토익 점수를 저장하는 변수를 선언한다
  			// 여기에 코드를 삽입하세요
  		int ToEICscore;
  		// Scanner 객체를 생성하고 scan이 가리키게 한다
  		Scanner scan = new Scanner(System.in);
  		//평점을 입력 받는다
	    System.out.print("grade:");
  		grade = scan.nextDouble();
  		
  		// 토익 점수를 입력 받는다
  		System.out.print("TOEIC score:");
  			// 여기에 코드를 삽입 하세요
  		ToEICscore = scan.nextInt();
  		
  		// 평점과 토익 점수에 따라 적절한 메시지를 출력한다
  			// 여기에 코드를 삽입하세요
  		if(ToEICscore>=700){
  			 if(4.0<=grade){
  			   System.out.print("A");
  			 } else if(3.5<=grade){
  			   System.out.print("B");
  			 } else if(3.0<=grade){
  			   System.out.print("C");
  			 } else{
  			   System.out.print("D");
  			 }
  		}
  		else if(ToEICscore<700){
  			 System.out.print("D");
  		}
  }
}