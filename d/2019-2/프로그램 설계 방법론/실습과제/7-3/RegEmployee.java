// 정규직 직원을 나타낸다
public class RegEmployee extends Employee{
	protected double yearlySalary;	// 연봉
	protected double bonusRate;		// 보너스 지급률

	// 정규직 직원의 이름, 소속부서, 연봉과 보너스 지급률을
	// 각각 주어진 값으로 초기화하면서 RegEmployee 객체를 생성한다
	public RegEmployee (String name, String department, double newyearlySalary, double newbonusRate) {
			// 여기에 코드를 입력하세요
			super(name,department);
			yearlySalary = newyearlySalary;
			bonusRate = newbonusRate;
	}
	// 정규직 직원의 월급을 계산한다
	public double pay(){
	// 여기에 코드를 입력하세요
		return ((yearlySalary/12)*(1+bonusRate));
	}
	
	// 정규직 직원의 모든 데이터를 반환한다
	public String toString() {
		// 여기에 코드를 입력하세요
		return ("이름: "+super.getName()+", 소속부서: "+super.getDepartment()+", 연봉: "+yearlySalary+", 보너스 지급률: "+bonusRate);
	}
	
}
