// 학점 인정 교과목을 나타낸다.
public class PassFailCourse extends Course {
	int reportScore;	// 보고서 점수
	int ptScore;		// 발표 점수
	
	
	//학점 인정 교과목의 변수들 값을 주어진 값들로 초기화한다.
	public PassFailCourse(String cname){
	// 여기에 코드를 입력하세요
	super(cname);
	super.setattendScore(0);
	reportScore = 0;
	ptScore = 0;
	}
	// 교과목의 보고서 점수를 반환한다
	public int getReportScore()	{	
		// 여기에 코드를 입력하세요
		return reportScore;
	}
	//교과목의 발표점수를 반환한다
	public int getPtScore() {
		//여기에 코드를 입력하세요
		return ptScore;
	}
	
	// 교과목의 총점을 계산하여 반환한다
	public int getTotal() {
	  // 여기에 코드를 입력하세요
	  return (super.getattendScore()*2+reportScore*6+ptScore*2)/10;
	}
	// 교과목의 학점을 반환한다
	public String getGrade(){
		// 여기에 코드를 입력하세요
		int total = (super.getattendScore()*2+reportScore*6+ptScore*2)/10;
		String grade;
		if(total >=60) grade = "CR";
		else grade = "NC";
		return grade;
	}
	// 교과목의 교과목의 이름, 출석 점수, 보고서 점수와 발표 점수를 반환한다
	public String toString(){
		// 여기에 코드를 입력하세요
		return (super.toString()+", 보고서 점수: "+reportScore+", 발표 점수: "+ptScore);
	}
	// 교과목의 보고서 점수를 변경한다
	public void setReportScore(int newReportScore)
	{
	  reportScore = newReportScore;
	}
	// 교과목의 발표 점수를 변경한다
	public void setPtScore(int newPtScore) {
	// 여기에 코드를 입력하세요
	  ptScore = newPtScore;
	}
}
