public class LetterGradeCourse extends Course {
	int assignScore; // 과제 점수
	int examScore; // 시험 점수

	// 문자 학점 교과목의 변수들 값을 주어진 값들로 초기화한다
	public LetterGradeCourse(String cname){
		// 여기 에 코드를 입력하세요
    super(cname);
    super.setattendScore(0);
    assignScore = 0;
    examScore = 0;
	}

	// 교과목의 과제 점수를 반환한다
	public int getAssignScore() {
		// 여기에 코드를 입력하세요
		return assignScore;
	}
	
	// 교과목의 시험 점수를 반환한다
	public int getExamScore() {
		// 여기에 코드를 입력하세요
		return examScore;
	}
	
	//교과목의 총점을 계산하여 반환한다
	public double getTotal() {
		// 여기에 코드를 입력하세요
		
		return ((super.getattendScore()*2+assignScore*3+examScore*5)/10);
	}
	// 교과목의 학점을 반환한다
	public String getGrade() {
		// 여기에 코드를 입 력 하세요
		String grade = "";
		int total = (super.getattendScore()*2+assignScore*3+examScore*5)/10;
		if(total>=90) grade = "A";
		else if(total>=80) grade = "B";
		else if(total>=70) grade = "C";
		else if (total>=60) grade = "D";
		else grade = "F";
		return super.getGrade(grade);
	}
	
	// 교과목의 이름, 출석 점수, 과제 점수와 시험 점수를 반환한다.
	public String toString(){
		// 여기에 코드를 입력하세요
		return (super.toString()+", 과제 점수: "+assignScore+", 시험 점수: "+examScore);
	}

	// 교과목의 과제 점수를 변경한다
	public void setAssignScore(int newAssignScore) {
		// 여기에 코드를 입력하세요
		assignScore = newAssignScore;

	}
	// 교과목의 시힘 점수를 변경한다
	public void setExamScore(int newexamScore) {
		// 여기에 코드를 입력하세요
		examScore = newexamScore;
	}

}