public class Dog extends Pet{
	private String breed;	    	// 품종
	private boolean boostreShot;// 예방주사 접종 여부
	
	// 개의 이름, 나이, 품종을 각각 기본 값으로 초기화하고
	// 예방주사 접종여부는 false로 초기화하면서 Dog 객체를 생성한다
	// 품종 기본 값: 빈 문자열
	public Dog()
	{
	// 여기에 코드를 입력하세요
	super();
	breed = "";
	boostreShot = false;
	
	}
	
	// 개의 이름, 나이, 품종을 각각 주어진 값으로 초기화하고
	// 예방주사 접종여부는 false로 초기화하먼서 Dog 객체를 생성한다
	public Dog(String name, int age, String breed)
	{
	  super.setName(name);
	  super.setAge(age);
	  setBreed(breed);
	  
	// 여기에 코드를 입력하세요
	}
	
	// 개의 모든 데이터를 알려 준다
	public String toString() {
	// 여기에 코드를 입력하세요
	return (super.toString()+", 품종: "+breed+", 접종여부: "+boostreShot);
	}

	// 개의 품종을 변경한다
	public void setBreed(String newBreed){
	// 여기에 코드를 입력하서세요
	breed = newBreed;
	}
	
	// 개의 예방주사 접종여부를 변경한다
	public void setboostreShot() {
		//여기에 코드를 입력하세요
		if(boostreShot == false) boostreShot = true;
		else boostreShot = false;
	}

	// 개의 품종을 알려준다
	public String getGreed() {
		//여기에 코드를 입력하세요
		return breed;
	}
	
	// 개의 예방주사 접종 여부를 알려준다
	public boolean getboostreShot() {
		// 여기에 메소드를 입력하세요
		return boostreShot;
	}
}