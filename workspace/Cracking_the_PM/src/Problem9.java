import java.util.Stack;

//Write a function which takes a stack as input and returns a new stack which has the elements reversed
public class Problem9 {
	static Stack Solution(Stack input){
		int size = input.size();
		Stack output = new Stack();
		for(int i=0; i<size; i++){
			output.push(input.pop());
		}
		return output;
	}
	public static void main(String[] args){
		Stack input = new Stack();
		Stack output = new Stack();
		Stack temp = new Stack();
		int[] a={1,2,3,4,5,6,7,8,9,10};
		for(int i=0; i<a.length; i++){
			input.push(a[i]);
			temp.push(a[i]);
		}
		
		output = Solution(input);

		//print out the returned input
		System.out.println(temp.toString());
		System.out.println(output.toString());

	}

}
