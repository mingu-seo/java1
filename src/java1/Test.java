package java1;

public class Test {

	public static void main(String[] args) {
		String format = "4D,IMAX";
		
		String[] formatArr = format.split(",");
		
		for (int i=0; i<formatArr.length; i++) {
			System.out.println("<input type='checkbox' name='"+formatArr[i]+"'>"+formatArr[i]+"</option>");
		}
	}
}
