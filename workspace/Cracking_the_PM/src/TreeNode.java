
public class TreeNode {
	TreeNode right;
	TreeNode left;
	int val;
	
	public TreeNode getRightChild(){
		return this.right;
	}
	
	public TreeNode getLeftChild(){
		return this.left;
	}
	
	public boolean hasChildren(){
		if(this.right!=null || this.left!=null){
			return true;
		}else{
			return false;
		}
	}
}



