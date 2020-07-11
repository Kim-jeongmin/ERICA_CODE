import java.util.Scanner; 
class Main {
  public static void main(String[] args) {
    double r, h, volume = 0, area = 0; 
    Scanner scan = new Scanner(System.in); 
    r = scan.nextInt();
    h = scan.nextInt();
    volume = (1.0/3.0) * Math.PI * r* r* h;
    area = Math.PI * r * Math.sqrt(r*r+h*h) + Math.PI *r *r;  // 여기에 코드를 입력하세요. 
    
    // 사용자로부터 r 입력받기 
    // 사용자로부터 h 입력받기 
    
    // 힌트: Math.PI, Math.sqrt 사용 
    
    System.out.println(volume); 
    System.out.println(area); 
  }
}