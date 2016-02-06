import java.util.Stack;

//Take out all even numbers from a stack
public class Problem10 {
	static Stack Solution(Stack input){
		Stack odd = new Stack();
		while(!input.empty()){
			int value =Integer.parseInt(input.pop().toString());
			if(value%2!=0){
				odd.push(value);
			}
		}
		
		//reverse stack
		
		return reverse(odd,input);
	}
	
	static Stack reverse(Stack input, Stack original){
		int size = input.size();
		for(int i=0; i<size; i++){
			original.push(input.pop());
		}
		return original;
	}
	
	public static void main(String[] args){
		Stack input = new Stack();
		Stack output = new Stack();
		Stack temp = new Stack();
		int[] a={2,4,5,5,5,7,6,8,2,9};
		for(int i=0; i<a.length; i++){
			input.push(a[i]);
			temp.push(a[i]);
		}
		
		output = Solution(input);
		System.out.println(temp.toString());
		System.out.println(output.toString());

	}
}
