//Implement Insertion Sort
public class Problem14 {
	static int[] insertionSort(int[] input, int i){
		
		if((i+1)==input.length){
			return input;
		}

		if(input[i]>input[i+1]){
			int temp=input[i];
			input[i]=input[i+1];
			input[i+1]=temp;
//			for(int s:input){
//				System.out.println(s);
//			}
			insertionSort(input,i+1);
		}
		
		if(i!=0 && input[i-1]>input[i]){
//			for(int s:input){
//				System.out.println("/" + s);
//			}
			insertionSort(input,i-1);
		}

		return input;
	}
	public static void main(String[] args){
		int[] a = {5,2,4,1,3};
		int[] b= insertionSort(a,0);
				for(int s:b){
					System.out.println(s);
				}
	}
}
