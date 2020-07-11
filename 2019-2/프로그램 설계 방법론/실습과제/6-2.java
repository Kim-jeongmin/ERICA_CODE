class Main {
  public static String[] getSuffixArray (String s) {
    // fill here!
    String[] arr = new String[s.length()];
    for(int k=0;k<s.length();k++){
      arr[k]=s.substring(k);
    }
    return arr;
  }
  public static void main(String[] args) {
    String[] suffix_arr = getSuffixArray("program"); 
    for (int i = 0; i < suffix_arr.length; i++) {
      System.out.println(suffix_arr[i]); // program, rogram, ogram, gram, ram, am, m
    }
  }
}