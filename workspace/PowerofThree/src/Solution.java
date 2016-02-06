
public class Solution {
    public static boolean isPowerOfThree(int n) {
    	if(n<=0){
    		return false;
    	}
        //base change algorithm
        double exponent = Math.log10(n) / Math.log10(3);
        		
        if(exponent % 1 !=0){
        	return false;
        }
        return true;
        
    }
    
    public static void main(String[] args){
    	int k = 273;
    	System.out.println(isPowerOfThree(273));
    }
}
