package Q;

public class Q6 {
	public static int countNumberStrings(String[] strs) throws NumberFormatException,NullPointerException {
		// fill here!
		int sum=0;
		for(int i=0;i<strs.length;i++) {
			Integer.parseInt(strs[i]);
			sum++;
		}
		return sum;
	}

		
	}
	public static void main(String[] args) {
		String[] strs = {"123", "abc", "12", "", null};
		System.out.println(countNumberStrings(strs)); // 2
	}
}
