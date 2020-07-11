package Q;

public class Q2 {
	class Person {
		private String name;
		public Person(String n) { name = n; }
		public String getName() { return name; }
	} 
	class Undergrad extends Person {
		private char grade; 
		public Undergrad(String n, char g) { super(n); grade = g; }
		public int getGrade() { return grade; }
	} 
	class Faculty extends Person {
		private int salary;
		public Faculty(String n, int s) { super(n); salary = s; }
		public int getSalary() { return salary; }
	} 

	public class Q2 {
		public static int countUndergrad(Person[] people, char grade) {
			// fill here!
			if(people == NULL) return 0;
			else {
				for(int i=0;i<people.length;i++) {
					System.out.print(people);
				}
			}
			
		}
		public static void main(String[] args) {
		Person[] people = new Person[10];
		Undergrad s1 = new Undergrad("kim", 'A');
		Undergrad s2 = new Undergrad("lee", 'B');
		Undergrad s3 = new Undergrad("park", 'A');
		Faculty f1 = new Faculty("lee", 100);
		Faculty f2 = new Faculty("kim", 200);
		people[0] = s1; people[1] = s2;
		people[2] = s3; people[3] = f1; people[4] = f2;
		System.out.println(countUndergrad(people, 'A')); // 2
		}
}

