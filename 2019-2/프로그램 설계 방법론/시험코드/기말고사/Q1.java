package Q;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Q1 {
	public static void main(String[] args) throws IOException {
		PrintWriter outfile = new PrintWriter(new FileWriter("test"));
		outfile.println("Hello world!");
		outfile.close();
	}


}
