public class Student {
	private String name; // 이름
	private int number; // 학번
	//이름을 기본 값으로 초기화하면서 Student 객체를 생성한다
	public Student() {
    //여기에 코드를 입력하세요
    name = "";
	}
	//이름을 매개번수 값으로 초기화하면서 Student 객체를 생성한다
	public Student(String Name, int Number) {
    //여기에 코드를 입력하세요
    this.name = Name;
    this.number = Number;
	}

	// 이름을 반환한다
	public String getName() {
    //여기에 코드를 입력하세요
    return name;
	}
	//학번을 반환한다
	public int getNumber() {
    //여기에 코드를 입력하세요
    return number;
	}
	// 학생의 모든 데이터를 반환한다.
	public String toString() {
    return("이름: "+name+", 학번: "+number);
	}
	//현 객체의 현재 상태가 other 객체와 같은지 알려준다.
	public boolean equals(Student other) {
    return (this.name==other.name)&&(this.number==other.number);
	}
	// 이름을 주어진 값으로 변경한다
	public void setName(String Name) {
    //여기에 코드를 입력하세요
    this.name = Name;
	}
	//학번을 주어진 값으로 변경한다
	public void setNumber(int Number) {
    //여기에 코드를 입력하세요
    this.number = Number;
	}
}