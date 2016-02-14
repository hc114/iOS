
public class TreeNode {
	int val;
	TreeNode right;
	TreeNode left;
	
	public TreeNode getRightChild(){
		return this.right;
	}
	
	public TreeNode getLeftChild(){
		return this.left;
		
	}
	
	public Boolean hasChildren(){
		if(this.right!=null || this.left!=null){
			return true;
		}else{
			return false;
		}
	}
	
}


