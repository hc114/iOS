public class Problem2{
	static int[] Solution2(int[] a){
		//figure out how many elements
		int count = a.length / 2;
		int index=0;

		while(count!=0){
			int temp=a[index];
			a[index]=a[a.length-(index+1)];
			a[a.length-(index+1)]=temp;
			index++;
			count--;
		}
		return a;
	}

	public static void main(String[] args){
		int[] a = {1,2,3,4,5,6,7,8,9};
		int[] b = {1,2,3,4,5,6,7,8,9,10};

		int[] sol_a = Solution2(a);
		int[] sol_b = Solution2(b);

		for(int i=0; i<a.length; i++){
			System.out.println("a is" + sol_a[i]);
		}

		for(int j=0; j<b.length; j++){
			System.out.println("b is "+ sol_b[j]);
		}
	}

}