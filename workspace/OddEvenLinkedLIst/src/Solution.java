/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */

public class Solution {
	/**
	 *         head   eventHead   trav
	 *         [1] -> [2]         [3] -> [4] -> ...
	 */
	public ListNode oddEvenList(ListNode head) {
	    if(head == null || head.next == null)
	        return head;

	    ListNode evenHead = head.next;
	    ListNode evenTrav = evenHead;
	    ListNode oddTrav = head;
	    ListNode trav = head.next.next;
	    evenHead.next = null;
	    int i = 1;

	    while(trav != null ){
	        if(i%2 != 0){
	            oddTrav.next = trav;
	            trav = trav.next;
	            oddTrav.next.next = evenHead;
	            oddTrav = oddTrav.next;
	        }else{
	            evenTrav.next = trav;
	            trav = trav.next;
	            evenTrav.next.next = null;
	            evenTrav = evenTrav.next;
	        }
	        i++;
	    }

	    return head;
	}
}