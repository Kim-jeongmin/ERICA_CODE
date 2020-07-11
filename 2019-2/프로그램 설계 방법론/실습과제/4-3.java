import java.util.Scanner;
class Main {
  public static void main(String[] args) {
		// 한 과목의 평가 요소들의 점수들을 저장하는 변수들을 선언한다
		int attendScore;
		int assignmentScore;
		int quizScore;
		int midtermexamScore;
		int finalexamScore;
		// 총점을 저장하는 변수를 선언한다
			// 여기에 코드를 삽입하세요
		//학점을 저장하는 변수를 선언한다
			//여기에 코드를 삽입하세요
		String grade;
		// 키보드로부터 입력하는 데이터를 읽기 위한 Scanner 객체를 만든다.
		Scanner scan = new Scanner(System.in);
		
		// 사용자로부터 각 평가 요소의 점수를 한 번에 하나씩 입력하라고 요청한다.
		// 그리고 입력된 점수를 읽는다.
	  System.out.print("attendance score:");
		// 여기에 코드를 삽입하세요
		attendScore = scan.nextInt();
		System.out.print("assignment score:");
		// 여기에 코드를 삽입하세요
		assignmentScore = scan.nextInt();
		System.out.print("quiz score:");
		// 여기에 코드를 삽입하세요
		quizScore = scan.nextInt();
		System.out.print("midterm exam score:");
		// 여기에 코드를 삽입하세요
		midtermexamScore = scan.nextInt();
		System.out.print("final exam score:");
		// 여기에 코드를 삽입하세요
		finalexamScore = scan.nextInt();
				
		// 총점을 계산한다
			// 여기에 코드를 삽입하세요
		double Totalscore = attendScore*0.1 + assignmentScore*0.4 + quizScore*0.1 + midtermexamScore*0.2 + finalexamScore*0.2;
		
		// 학점을 결정한다
			// 여기에 코드를 삽입하세요
		if(Totalscore>=90){
		  grade = "A";
		} else if (Totalscore>=80){
		  grade = "B";
		} else if (Totalscore>=70){
		  grade = "C";
		} else if (Totalscore>=60){
		  grade = "D";
		} else{
		  grade = "F";
		}
		
		// 총점과 학점을 출력한다
		System.out.println("total score:" + Totalscore);
		System.out.println("grade:" + grade);
  }
}