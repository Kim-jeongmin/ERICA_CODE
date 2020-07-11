class Main {
  public static int string_sum(String str) {
    // fill here! 
    int sum=0;
    String[] words = str.split(" ");
    for(int i=0;i<words.length;i++){
      for(int j=0;j<words[i].length();j++){
        if(words[i].charAt(j)<48 || words[i].charAt(j)>57) return 0;
      }
      sum+=Integer.parseInt(words[i]);
    }
    return sum;

	}

	public static void main(String[] args) {
		System.out.println(string_sum("100 q 300")); // 0
		System.out.println(string_sum("100 300")); // 400
	}
}