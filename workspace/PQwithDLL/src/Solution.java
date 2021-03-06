import java.util.ArrayList;

public class Solution {
	static ListNode createList(char[] chars){
		ListNode head = null;
		for(int i=0; i<chars.length; i++){
			if(head==null){
				head=new ListNode(chars[i]);
				head.prev=null;
			}else{
				ListNode temp = head;
				head=head.next;
				head=new ListNode(chars[i]);
				head.prev=temp;
			}
		}
		return head;
	}
	static ArrayList LIFO(ListNode head){
		ArrayList<Character> queue = new ArrayList<>();
		while(head!=null){
			char s=head.val;
			queue.add(head.val);
			head=head.prev;
		}
		return queue;
	}
	public static void main(String[] args){
		//Create linked list
		char[] c = {'a','b','c','d','e','f','g'};
		ArrayList<Character> result = new ArrayList<>();
		result = LIFO(createList(c));
		System.out.println(result.toString());
	}
}
