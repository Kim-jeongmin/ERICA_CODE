class Main {
  public static int fact(int n) {
		
		try {
		  // fill here!
		  int sum = 1;
		  if(n>0){
		    for(int i=n;i>0;i--){
		      sum*=i; 
		    }
		    return sum;
		  }
		  else throw new IllegalArgumentException();
		} 
		catch (IllegalArgumentException e) {
		  // fill here!
		  System.out.println("Negative numbers cannot be calculated");
		}
		
		return n;
	}

	public static void main(String[] args) {
	  System.out.println(fact(5));
	  //120
	  
		System.out.println(fact(-5));
		//Negative numbers cannot be calculated
    //-5


	}
}