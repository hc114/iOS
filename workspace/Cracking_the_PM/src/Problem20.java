import java.util.ArrayList;

//Given a string, print all permutations of that string. You can assume the world does not have any duplicate characters"
public class Problem20 {
	static ArrayList Solution(String given, String addition){
		ArrayList<String> Solutions = new ArrayList<>();
		
		/*Addition to the front and the end*/
		Solutions.add(String.format(addition+"%s", given));
		Solutions.add(String.format("%s"+addition, given));
		
		for(int i=0; i<given.length();i++){
			String[] parts = {given.substring(0, i),given.substring(i,given.length())};
			String combo = String.format("%s" + addition + "%s",parts[0],parts[1]);
			Solutions.add(combo);
		}
		return Solutions;
	}
	
	public static void main(String[] args){
		/*given 
		 * abc->abc,acb,bac,bca,cab,cba
		 *Find the permutations of d in each 
		 *Solution(abc,d)/ Solution(acb,d)/ Solution(bac,d)
		 */
		String[] existing = {"abc","acb","bac","bca","cab","cba"};
		for(int i=0; i<existing.length;i++){
			System.out.println(Solution(existing[i],"d"));
		}
		
		
	}

}
