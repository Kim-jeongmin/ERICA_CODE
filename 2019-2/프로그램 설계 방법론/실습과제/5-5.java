import java.util.Scanner;
class Main {
  public static void main(String[] args) {
		int n;

		System.out.print("Please enter an integer:");
		Scanner scan = new Scanner(System.in);
		n = scan.nextInt();
		
		
		// 여기에 코드를 입력하세요
		for(int i=1;i<n+1;i++){
		  for(int j=1;j<n+1;j++){
		    if(i%j==0 && i!=j) System.out.print("("+i+","+j+")\n");
		  }
		}
  }
}