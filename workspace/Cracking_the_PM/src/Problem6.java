
public class Problem6 {
	static int Sum(TreeNode head){
		
		
		if(head==null){
			return 0;
		}
		
		int Sum = head.val;
		
		
		if(!head.hasChildren()){
			return Sum;
		}else{
			Sum=Sum+head.right.val+head.left.val;
			Sum=Sum+Sum(head.right);
			Sum=Sum+Sum(head.left);
			
		}
		return 0;
	}
}
