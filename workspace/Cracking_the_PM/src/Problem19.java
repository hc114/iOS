import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;

public class Problem19 {
	static void Solution(int max){
		/*Pairs to sum pairing*/
		HashMap<Integer, ArrayList<String>> map = computeSums(max);
		
		/*Print pairs of pairs*/
		printSolutions(map);
	}
	
	static HashMap computeSums(int max){
		HashMap<Integer, ArrayList<String>> sums = new HashMap<>();
		for(int a=0; a<max; a++){
			for(int b=0; b<max; b++){
				int sum = a*a*a+b*b*b;
				String solution = a+","+b;
				
				/* Add sum and pair to hashtable*/
				if(!sums.containsKey(sum)){
					sums.put(sum, new ArrayList<String>());
				}
				
				ArrayList<String> solutions = sums.get(sum);
				solutions.add(solution);
			}
		}
		return sums;
	}
	
	static void printSolutions(HashMap<Integer, ArrayList<String>> map){
		for(int sum: map.keySet()){
			ArrayList<String> solves = map.get(sum);
			printSolutionsforSum(solves);
		}
	}
	
	static void printSolutionsforSum(ArrayList<String> solutions){
		for(int i=0; i<solutions.size(); i++){
			for(int j=0; j<solutions.size(); j++){
				String sol = solutions.get(i) + "," + solutions.get(j);
				System.out.println(sol);
			}
		}
	}
	
	public static void main(String[] args){
		int max=1000;
		Solution(max);
	}
}