public class Q1 {

	public static void main(String[] args) {
		int a, b, sum;
		a = 5;
		b = 7; 
		sum = a + b;
		System.out.println("a + b = " + sum);
	}
}

class Triangle {
	private int side1;
	private int side2;
	private int side3;
	
	public Triangle(int v1, int v2, int v3) {
                // fill here!
    side1=v1;
    side2=v2;
    side3=v3;
	}
	public boolean isRightAngled() {
                // fill here!
    boolean a;
    if(side2>=side3 && side2>=side1){
      if(Math.pow(side2,2)==Math.pow(side1,2)+Math.pow(side3,2)) a=true;
      else a=false;
    }
    else if(side3>=side1 && side3>=side2){
      if(Math.pow(side3,2)==Math.pow(side2,2)+Math.pow(side1,2)) a=true;
      else a=false;
    }
    else if(side1>=side3 && side1>=side2){
      if(Math.pow(side1,2)==Math.pow(side2,2)+Math.pow(side3,2)) a=true;
      else a=false;
    }
    else a=false;
    return a;
  }
	public boolean isTwoEqualSided() {
      // fill here!\
    boolean b;
    if(side1==side2) b=true;
    else if(side2==side3) b=true;
    else if(side1==side3) b=true;
    else b= false;
    return b;
  }
	public boolean isAllEqualSided() {
                // fill here!
    boolean c;
    if(side1==side2 && side2==side3) c=true;
    else c= false;
    return c;
	}
	public boolean isAcute() {
                // fill here!
    boolean d;
    if(side2>=side3 && side2>=side1){
      if(Math.pow(side2,2)<Math.pow(side1,2)+Math.pow(side3,2)) d=true;
      else d=false;
    }
    else if(side3>=side1 && side3>=side2){
      if(Math.pow(side3,2)<Math.pow(side2,2)+Math.pow(side1,2)) d=true;
      else d=false;
    }
    else if(side1>=side3 && side1>=side2){
      if(Math.pow(side1,2)<Math.pow(side2,2)+Math.pow(side3,2)) d=true;
      else d=false;
    }
    else d=false;
    return d;
  }
	public boolean isObtuse() {
                // fill her
    boolean e;
    if(side2>=side1 && side2>=side3){
      if(Math.pow(side2,2)>Math.pow(side1,2)+Math.pow(side3,2)) e=true;
      else e=false;
    }
    else if(side3>=side1 && side3>=side2){
      if(Math.pow(side3,2)>Math.pow(side2,2)+Math.pow(side1,2)) e=true;
      else e=false;
    }
    else if(side1>=side3 && side1>=side2){
      if(Math.pow(side1,2)>Math.pow(side2,2)+Math.pow(side3,2)) e=true;
      else e=false;
    }
    else e=false;
    return e;
  }
}
public class Q2 {
	public static void main(String[] args) {
                        // test code
		Triangle t1 = new Triangle(3,5,4); 
		System.out.println(t1.isRightAngled()); // true
		System.out.println(t1.isObtuse()); // false
		System.out.println(t1.isAllEqualSided()); // false
		Triangle t2 = new Triangle(10,3,4); 
		System.out.println(t2.isRightAngled()); // false
		System.out.println(t2.isObtuse()); // true
		System.out.println(t2.isAllEqualSided()); // false
	}
}

public class Main {
	public static int getOccurrence (String s, String sub) {
		int count = 0; 
		for (int i = 0; i <= s.length() - sub.length(); i++) {
		// fill here!
      int j=0;
        for(int k=0;k<sub.length();k++){
          if(s.substring(i,i+sub.length()).charAt(k)==sub.charAt(k)){
            j+=1;
          }
        }
      if(j==sub.length()) count+=1;
		// 다음을 사용: s.substring(i1,i2): 구간 i1 ~  i2-1에 해당하는 s의 부분문자열 반환
		}
		return count;
	}
  public static void main(String[] args) {
		System.out.println(getOccurrence("abcd ab", "ab")); // 2
		System.out.println(getOccurrence("bbbb", "bb")); // 3
	}
}

public class Q4 {

	public static int newfibonacci(int n) {
		// fill here!
    int k=3;
    int[] arr=new int[4];
    for(int i=0;i<n;i++){
      arr[3]=arr[0]*2;
      arr[0]=arr[1];
      arr[1]=arr[2];
      arr[2]=arr[3];
      arr[3]=1;
    }
    return arr[3];

	}
	public static void main(String[] args) {
		System.out.println(newfibonacci(10)); // 19
	}

class Coins {
	private int quaters; // 25 cents
	private int dimes; // 10 cents
 	private int nickels; // 5 cents
	private int pennies; // 1 cent
	public Coins(int initial_amount) {
		// initial_amount is given in cents 
		// fill here!
		
	}
	public Coins add(Coins other) {
		// fill here!
	}
	public int tocents() {
		// fill here!
	}
}

class BankAccount {
    private Coins balance;

    public BankAccount(Coins initial_amount) {
    	// fill here!
    }
    public Coins getBalance() {
    	// fill here!
    }
    public boolean deposit(Coins coins) {
    	// fill here!
    }
}

public class Q5 {
  public static void main(String[] args) {
    Coins coins = new Coins(100); 
    BankAccount account = new BankAccount(coins);
    account.deposit(coins);
    System.out.println("balance = " + account.getBalance().tocents()); // balance = 200
  }
}
	

	
