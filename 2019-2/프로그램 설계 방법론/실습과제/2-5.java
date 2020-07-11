import java.util.Scanner;
class Main {
  public static void main(String[] args) {
    int total;  // 총 시간 (초) 
    int days = 0, hours = 0, minutes = 0, seconds = 0; // 일,시간,분,초  
    
    Scanner scan = new Scanner(System.in); 
    total = scan.nextInt(); 
    days = total/(60*60*24);
    hours = (total-days*60*60*24)/(60*60);
    minutes = (total-days*60*60*24-hours*60*60)/60;
    seconds = (total-days*60*60*24-hours*60*60-minutes*60);
    
    // 여기에 코드를 입력하세요. 
    
    System.out.println("총 시간(seconds):");
    System.out.println(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초");
  }
}