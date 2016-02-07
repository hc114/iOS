import java.util.LinkedList;
import java.util.Queue;


//Write a function to check if two queues are identical. It's okay to modify/destroy the two queues
public class Problem11 {
	static Boolean Solution(Queue a, Queue b){
		while(!a.isEmpty()){
			if(a.peek()==b.peek()){
				a.remove();
				b.remove();
			}else{
				return false;
			}
		}
		if(a.isEmpty() && b.isEmpty()){
			return true;
		}
		return false;
	}
	
	public static void main(String[] args){
		Queue input = new LinkedList();
		Queue input2 = new LinkedList();
		Queue temp = new LinkedList();
		int[] a={2,4,5,5,5,6,7,8,2,9};
		int[] b={2,4,5,5,5,6,7,8,2,9};
		
		for(int i=0; i<a.length; i++){
			input.add(a[i]);
			input2.add(b[i]);
		}
		
		Boolean result = Solution(input,input2);
		System.out.println(result);
	}
}
