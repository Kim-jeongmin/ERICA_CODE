class Main {
  public static int longest_incseq(int[] arr) {
    // fill here! 
    int max=arr[0],sum=1;
    for(int i=0;i<arr.length-1;i++){
      if(max<arr[i+1]){
        max=arr[i+1];
        sum+=1;
      }
    }
    return sum;
  }
  public static void main(String[] args) {
    int[] arr = {10, 20, 10, 30, 20, 50};
    System.out.println(longest_incseq(arr)); // 4
  }
}