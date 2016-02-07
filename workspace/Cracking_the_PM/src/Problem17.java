//Use depth-first search, check if a tree contains a value
public class Problem17 {
	static Boolean Solution(TreeNode head, int value){
		if(head==null){
			return false;
		}
		
		if(head.val==value){
			return true;
		}
		
		if(head.right!=null){
			Solution(head.right,value);
		}
		
		if(head.left!=null){
			Solution(head.left,value);
		}
		
		return false;
	}
	
	public static void main(String[] args){
		
	}
}
