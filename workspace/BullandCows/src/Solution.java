import java.util.ArrayList;

public class Solution {
	public static String getHint(String secret, String guess){
		ArrayList<Character> myList = new ArrayList<>();
		int Bulls =0;
		int Cows = 0;
		
		for(int i=0; i<secret.length(); i++){
			myList.add(secret.charAt(i));	
		}
		System.out.println(myList.toString());


		for(int j=0; j<guess.length(); j++){
			if(myList.contains(guess.charAt(j))){
				if(secret.charAt(j)==guess.charAt(j)){
					System.out.println("myList is "+myList);	
					System.out.println(secret.charAt(j)+"and"+guess.charAt(j));
					Bulls++;
					myList.remove(new Character(secret.charAt(j)));
					
				}else{
					//myList.remove(new Character(secret.charAt(j)));
					System.out.println("myList is "+myList);
					System.out.println(secret.charAt(j)+"and"+guess.charAt(j));
					Cows++;
				
				}
			}
		}
		return String.format("%dA%dB", Bulls,Cows);
	}

	public static void main(String[] args){
		String result=getHint("1122","1222");
		System.out.println(result);
	}
}
