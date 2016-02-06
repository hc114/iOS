
//Sort a linked list that contains just 0s and 1s. Modify the list such that all 0s come before all 1s
public class Problem7 {
	void Solution8(ListNode head){
		ListNode stationary = head;
		while(head.next!=null){
			if(head.next.val==0){
				ListNode newHead = new ListNode(head.next.val);
				newHead.next=stationary;
				stationary=newHead;
				if(head.next.next!=null){
					head.next=head.next.next;
				}
				
			}
			
		}
	}

}
