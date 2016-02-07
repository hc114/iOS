import java.util.LinkedList;
import java.util.Queue;

//Write a function to remove the 13th element from the queue
public class Problem12 {
	static Queue Solution(Queue input){
		Queue temp = new LinkedList();
		int index = 12;
		while(!input.isEmpty()){
			if(index==0){
				input.poll();				
				temp.add(input.poll());	
			}
			
			//System.out.println(index);
			temp.add(input.poll());
			index--;				

		}

		return temp;
	}
	
	static Queue OptimizedSolution(Queue input){
		int originalLength = input.size();
		int index=12;
		
		for(int i=0; i<originalLength-2; i++){
			if(index==0){
				input.poll();
				input.add(input.poll());
			}
			System.out.println(input.toString());
			input.add(input.poll());
			index--;
		
		}
		
		return input;
	}
	public static void main(String[] args){
		Queue input = new LinkedList();
		Queue temp = new LinkedList();
		int[] a={2,4,5,5,5,6,7,8,2,9,10,11,12,13,14,15,16};

		for(int i=0; i<a.length; i++){
			input.add(a[i]);
		}

		//temp = Solution(input);
		temp = OptimizedSolution(input);
		System.out.println(temp.toString());
		//System.out.println(input.toString());
	}
}