
public class Main {

	public static void main(String[] args) {
		RegEmployee employeeOne; // RegEmployee 객체 잠조변수
		TempEmployee employeeTwo; // TempEmployee 객체 참조변수
		
		employeeOne = new RegEmployee("선미","마케팅",6000, 0.4);
		System.out.println(employeeOne.toString());
		//직원의 이름 : 선미, 소속 부서: 마케팅, 연봉: 6000.0, 보너스 지급률: 0.4
		System.out.println(employeeOne.pay());
		//700.0
		
		employeeTwo = new TempEmployee("지나", "연구개발", 1);
		System.out.println(employeeTwo.getHoursworked());
		//0
		employeeTwo.addHours(300);
		System.out.println(employeeTwo.getHoursworked());
		//300
		
		System.out.println(employeeTwo.toString());
		//직원의 이름 : 지나, 소속 부서: 연구개발, 시간당 임금: 1.0, 근무 시간: 300
		System.out.println(employeeTwo.pay());
		//300.0
		System.out.println(employeeTwo.toString());
		//직원의 이름 : 지나, 소속 부서: 연구개발, 시간당 임금: 1.0, 근무 시간: 0



	}

}
