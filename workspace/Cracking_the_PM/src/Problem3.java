import java.util.HashMap;

public class Problem3 {
	static boolean Solution(String[] a, String[] b){
		//HashMap<String,Integer> a_table  = new HashMap<>();
		HashMap<String,Integer> b_table = new HashMap<>();

		for(int i=0; i<b.length; i++){
			if(!b_table.containsKey(b[i])){
				b_table.put(b[i], 1);
			}else{
				int freq =  b_table.get(b[i])+1;
				b_table.put(b[i],freq);
			}
		}
		
		//check if A is a subset of b
		for(int j=0; j<a.length; j++){
			if(b_table.containsKey(a[j])){
				System.out.println(b_table.toString());
				if(b_table.get(a[j])==0){
					b_table.remove(a[j]);
					return false;
				}else{
					int rev_freq = b_table.get(a[j])-1;
					b_table.put(a[j],rev_freq);
					System.out.println(b_table.toString());
				}
			}
			

		}
	
		return true;
		
	}

	public static void main(String[] args){
		String[] a ={"a","b","c","c","d","d","d","e"};
		String[] b = {"a","b","b","c","c","d","d","d","e","e"};
		Boolean truth = Solution(a,b);
		System.out.println(truth);
	}
}
