package deleteNode;

public class Solution {
	public void deleteNode(ListNode node) {
		ListNode temp = new ListNode(node.next.val);
		if(temp!=null){
			node.val=temp.val;
			node.next=temp.next;
			
		}	
	}
}