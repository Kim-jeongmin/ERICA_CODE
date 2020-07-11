public class R51 {
	
	public static int max_find(int [] arr, int size) {
		if(size == 1) return arr[0];
		else return Math.max(arr[size-1], max_find(arr,size-1));
	}

	public static void main(String[] args) {
		int[] arr = new int[4]; 
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 4;
		arr[3] = 1;
		System.out.print(max_find(arr,3));
	}

}
