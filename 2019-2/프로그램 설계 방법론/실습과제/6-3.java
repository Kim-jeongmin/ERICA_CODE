class Main {
  public static int[] merge(int[] arr1, int[] arr2) {
    // fill here!
    int temp;
    int len=arr1.length+arr2.length;
    int[] arr = new int[len];
    for(int i=0;i<len;i++){
      if(i<arr1.length) arr[i]=arr1[i];
      else arr[i]=arr2[i-arr1.length];
    }
    for(int k=0;k<arr.length;k++){
      for(int j=0;j<len-1;j++){
        if(arr[j]>arr[j+1]){
          temp=arr[j+1];
          arr[j+1]=arr[j];
          arr[j]=temp;
        }
      }
    }
    return arr;
    
  }
  public static void main(String[] args) {
    int[] arr1 = {1, 2, 4, 8, 16};
    int[] arr2 = {3, 6, 9, 12}; 
    int[] merged = merge(arr1, arr2); 
    for (int i = 0 ; i < merged.length; i++) {
      System.out.println(merged[i]); 
      // 1 2 3 4 6 8 9 12 16
    }
  }
}