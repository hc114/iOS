import java.util.LinkedList;
import java.util.Queue;

//Breadth first search
public class Problem18 {
	static Boolean Solution(Queue q, int v, TreeNode root){
		q.add(root);

		while(!q.isEmpty()){
			TreeNode node = (TreeNode) q.poll() ;
			if(node.val==v){
				return true;
			}
			
			if(root.right!=null){
				q.add(node.right);
				
			}
			
			if(root.left!=null){
				q.add(node.left);
			}
		}
		return false;
	}
	public static void main(String[] args){
		TreeNode root = new TreeNode();
		int value=0;
		Queue<TreeNode> queue = new LinkedList<>();
		Solution(queue,value,root);
	}
}
