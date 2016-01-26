public class Solution {

	public static boolean canWinNim(int n) { 
	//If you have arrive at mod 4 then you lose
		int count=0;
		//Is it your turn or my turn
		if(count % 2==0 && n%4==0){
			System.out.println("it's my turn and I lose");
			return false;
		}else{
			System.out.println("it's your turn and you lose");
			return true;
		}
	}

	public static void main(String args[]){
		canWinNim(1547);
		return;
	}
};