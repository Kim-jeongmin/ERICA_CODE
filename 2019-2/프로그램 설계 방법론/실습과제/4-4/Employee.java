public class Employee {
	private Double salary;	// 연봉
	private int evalGrade;	// 근무평가등급
	
	public Employee(double salary, int evalGrade) {
		this.salary = salary;
		this.evalGrade = evalGrade;
	}
	
	// get 함수 모음
	public double getSalary() {
		return salary;
	}
	
	public int getEvalGrade() {
		return evalGrade;
	}
	
	// set 함수 모음
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	public void setEvalGrade(int evalGrade) {
		this.evalGrade = evalGrade;
	}
	
	public void set(double salary, int evalGrade) {
		this.salary = salary;
		this.evalGrade = evalGrade;
	}
	
	// 근무평가등급에 따라 현재 연봉을 인상시키고, 연봉 인상 금액을 반환한다.
	public Double applyIncreaseRate() {
		// 여기에 코드를 삽입하세요
		if(evalGrade==1){
		  salary = getSalary()*1.06;
		} else if (evalGrade==2){
		  salary = getSalary()*1.04;
		} else{
		  salary =getSalary()*1.02;
		}
		return salary;
	}
}