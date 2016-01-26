package maxTrees;

public class Solution {
	public static int maxDepth(TreeNode root){	
		int right=0;
		int left=0;
		int max=0;
		if(root!=null&&root.left==null&&root.right==null){
			return 1;
		}
		
		if(root==null){
			return 0;
		}
		
		if(root.right!=null && root!=null){
			right=maxDepth(root.right)+1;
		}
		if(root.left!=null && root!=null){
			left = maxDepth(root.left)+1;	
		}
		if(left>=max){
			max=left;
		}else{
			max=right;
		}
		return max;
	}
}


