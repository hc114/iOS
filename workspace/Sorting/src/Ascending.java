import java.util.ArrayList;
import java.util.Stack;

public class Ascending {
	static void ascendingOrder(ArrayList<Integer> nums){
		Stack<Integer> sortStack = new Stack<>();
		ArrayList<Integer> popped = new ArrayList<>();
		int indexPoppedIndex=0;
		
		int index = 0;
		while(nums!=null){
			//sortStack.push(nums.get(index));
			//nums.remove(new Integer(nums.get(index)));
			if(sortStack==null){
				sortStack.add(nums.get(0));
			}
		
			if(nums.get(index+1)>nums.get(index)){
				sortStack.push(nums.get(index+1));
				index++;
			}else{
				popped.add(sortStack.pop());
				if(nums.get(index+1)<popped.get(indexPoppedIndex)){
					indexPoppedIndex++;
					popped.add(sortStack.pop());
				}else{
					sortStack.push(nums.get(index+1));
					index++;
					
				}
			}
		}
	}
	
	
	static void main(String[] args){

	}
}
