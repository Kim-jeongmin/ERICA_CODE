import java.util.Scanner;
class Main {
  public static void main(String[] args) {
		System.out.print("Please enter a sentence:");
		int a=0;
		int e=0;
		int i=0;
		int o=0;
		int u=0;
		int consonant=0;
		Scanner scan = new Scanner(System.in);
		String sentence = scan.nextLine();
		// 공백 제거
		// 소문자 변환
		for(int m=0;m<sentence.length();m++){
		  if(sentence.charAt(m)=='a' || sentence.charAt(m)=='A') a+=1;
		  else if(sentence.charAt(m)=='e' || sentence.charAt(m)=='E') e+=1;
		  else if(sentence.charAt(m)=='i' || sentence.charAt(m)=='I') i+=1;
		  else if(sentence.charAt(m)=='o' || sentence.charAt(m)=='O') o+=1;
		  else if(sentence.charAt(m)=='u' || sentence.charAt(m)=='U') u+=1;
		  else consonant+=1;
		}
		for(int k=0;k<sentence.length();k++){
		  if(sentence.charAt(k)==32) consonant-=1;
		}
		System.out.print("a:"+a+"\n");
		System.out.print("e:"+e+"\n");
		System.out.print("i:"+i+"\n");
		System.out.print("o:"+o+"\n");
		System.out.print("u:"+u+"\n");
		System.out.print("consonant:"+consonant+"\n");
		
		
  }
}