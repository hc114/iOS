import java.util.ArrayList;

//Given two sorted arrays, write a function to merge them in sorted order into a new array
public class Problem13 {
	//Let's use QuickSort
	static ArrayList Solution(int[] a, int[] b){
		//find out which one is bigger
		int[] source=null;
		int[] nonsource=null;
		if(a.length>b.length){
			source = a;
			nonsource=b;
		}else{
			source = b;
			nonsource=a;
		}

		int nonsource_pointer=0;
		int source_pointer=0;
		int count=0;
		ArrayList<Integer> result = new ArrayList<>();
		while(count!=source.length+nonsource.length-1){
			if(nonsource[nonsource_pointer]>source[source_pointer]){

				System.out.println("sp" + source_pointer);	
				result.add(source[source_pointer]);
				source_pointer++;

			}else{
				result.add(nonsource[nonsource_pointer]);
				nonsource_pointer++;	
				System.out.println("nsp " + nonsource_pointer);
			}

			count++;
		}
		return result;
	}
	public static void main(String[] args){
		//two sorted arrays
		int[] a = {1,3,5,7,9};
		int[] b = {2,4,6,8,10};

		ArrayList result=Solution(a,b);
		for(int i=0; i<result.size(); i++){
			System.out.println(result.get(i));
		}
	}
}
