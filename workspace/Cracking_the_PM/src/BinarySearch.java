import java.util.Arrays;

public class BinarySearch {
	static Integer index = 0;
	static int Solution(int[] a, int no,int left_index, int right_index){

		int middle =(left_index+right_index)/2;
		if(right_index<left_index){
			return -1;
		}

		if(no==a[middle]){
			System.out.println("index: " + middle);
			return middle;
		}
		if(no<a[middle]){
			System.out.println("no < then "+a[middle]);
			return Solution(a,no,left_index,middle-1);
		}
		
		if(no>a[middle]){
			System.out.println("no > then "+a[middle]);
			return Solution(a,no,middle+1,right_index);
		}
		
		System.out.println("reaching here why?");
		return -1;


	}
	public static void main(String[] args){
		int[] a = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		index=Solution(a,3,0,a.length-1);
		System.out.println("index is : " + index);
	}
}
