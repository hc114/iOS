
public class Solution {
	public static int addDigits(int num){
		if(num==0){
			return 0;
		}else{
			if(num%9==0){
				return 9;
			}else{
				return num%9;
			}
		}
	}
	public static void main(String[] args){
		int a=addDigits(555);
		System.out.println(a);
	}
}
