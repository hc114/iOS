//Given an array that is sorted then rotated, find the minimum value
public class Problem16 {
	static int Solution(int[] a){
		int index = 0;
		while(index!=a.length-1){
			if(a[index+1]>=a[index]){
				index++;
			}else{
				if(a[index+1]>a[0]){
					return a[0];
				}else{
					return a[index+1];
				}
			}
			
		}
		return 0;
		
	}
	
	public static void main(String[] args){
		int[]a = {10,11,12,13,14,9,8,7};
		System.out.println(Solution(a));
	}
}
