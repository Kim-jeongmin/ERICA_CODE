
public class R52 {
	static int[] arr = new int[5];
	public static int binary_search(int left,int right,int num) {
		int mid = (left + right) / 2;
		if(arr[mid] == num) return mid;
		if(left == right) return -1;
		else {
			if(arr[mid] > num) return binary_search(left,mid-1,num);
			else return binary_search(mid+1,right,num);
		}
	}
	public static void main(String[] args) {
		arr[0] = 2;
		arr[1] = 3;
		arr[2] = 4;
		arr[3] = 5;
		arr[4] = 9;
		System.out.println(binary_search(0,4,3));
	}
}
