
public class Problem5 {
	static boolean Solution(TreeNode head, TreeNode insert){
		if(head==null){
			return false;
		}
		
			if(head.val<insert.val){
				if(head.right==null){
					head.right=insert;
				}else{
					Solution(head.getRightChild(),insert);
				}
			}else{
				if(head.left==null){
					head.left=insert;
				}else{
					Solution(head.getLeftChild(),insert);
				}
			}
		
		return true;
	}
}
