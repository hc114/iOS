
public class Problem1 {
	static int[] Solution(int[] unsorted){
		int unsorted_int = unsorted[unsorted.length-1];
		for(int i=0; i<unsorted.length-1; i++){
			if(unsorted_int<unsorted[i]){
				unsorted_int = unsorted[i];
				unsorted[i]=unsorted[unsorted.length-1];
				unsorted[unsorted.length-1]=unsorted_int;

				System.out.println("hey" + unsorted[i]);
				System.out.println(unsorted[unsorted.length-1]);
			}
		}
		return unsorted;
	}
	public static void main(String[] args){
		int[] a = {32,33,34,35,36,38,39,37};
		int[] b=Solution(a);

		for(int i=0; i<b.length; i++){
			System.out.println(b[i]);	
		}
	}
}
