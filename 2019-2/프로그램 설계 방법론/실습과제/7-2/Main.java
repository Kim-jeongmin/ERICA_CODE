class Main {
  public static void main(String[] args) {
		LetterGradeCourse courseOne;
		PassFailCourse courseTwo;
		String grade;
		
		courseOne = new LetterGradeCourse("Data structure");
		System.out.println(courseOne.toString());
		//교과목 이름: Data structure, 출석점수: 0, 과제 점수: 0, 시험 점수:0
		
		courseOne.setattendScore(95);
		courseOne.setAssignScore(98);
		courseOne.setExamScore(83);
		
		System.out.println(courseOne.toString());
		//교과목 이름: Data structur, 출석점수: 95, 과제 점수: 98, 시험 점수:83

		System.out.println(courseOne.getGrade());
	  //B
	  
		courseTwo = new PassFailCourse("Culture Seminar");
		System.out.println(courseTwo.toString());
		//교과목 이름: Culture Seminar, 출석점수: 0, 보고서 점수: 0, 발표 점수:0
		
		courseTwo.setattendScore(85);
		courseTwo.setReportScore(92);
		courseTwo.setPtScore(78);
		System.out.println(courseTwo.toString());
		//교과목 이름: Culture Seminar, 출석점수: 85, 보고서 점수: 92, 발표 점수:78
		
		System.out.println(courseTwo.getGrade());
		//CR
  }
}