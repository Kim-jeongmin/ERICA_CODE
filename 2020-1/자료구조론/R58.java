
public class R58 {
	static int result = 0;
	static int p = 0;
	public static void String_to_Int (String str,int index) {
		if(index == -1) return;
		else {
			result += (str.charAt(index) - '0') * Math.pow(10,p++);
			String_to_Int(str,index-1);
		}
	}

	public static void main(String[] args) {
		String str = "13531";
		String_to_Int(str,4);
		System.out.println(result);
	}

}
