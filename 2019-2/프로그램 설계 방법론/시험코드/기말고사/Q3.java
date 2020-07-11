package Q;

public class Q3 {
	public static double string2double(String s) throws NullPointerException,NumberFormatException{
		// fill here!
		try {
			double a = Double.parseDouble(s);
			return a;
		}
		catch (NullPointerException e) {
			return -1.0;
		}
		catch (NumberFormatException e) {
			return -2.0;
		}
		
	}
	public static void main(String[] args) {
		System.out.println(string2double(null)); // -1.0
		System.out.println(string2double("abc")); // -2.0
		System.out.println(string2double("3.8")); // 3.8
	}
}
