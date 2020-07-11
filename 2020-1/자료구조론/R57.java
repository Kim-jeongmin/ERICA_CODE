
public class R57 {
	
	public static double harmonic_number(double num,double sum) {
		if(num == 1) return sum + 1;
		else return harmonic_number(num-1,sum + 1/num);
	}

	public static void main(String[] args) {
		System.out.println(harmonic_number(3,0));
	}

}
