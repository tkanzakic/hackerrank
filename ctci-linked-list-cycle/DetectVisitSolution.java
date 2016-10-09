// Solve problem Linked Lists: Detect a Cycle
// https://www.hackerrank.com/challenges/ctci-linked-list-cycle

/*
Detect a cycle in a linked list. Note that the head pointer may be 'null' if the list is empty.

A Node is defined as: 
    class Node {
        int data;
        Node next;
    }
*/

boolean hasCycle(Node head) {
    Map<Node, Node> map = new HashMap<Node, Node>();
    while (head != null) {
        if (map.containsKey(head)) {
            return true;
        }
        map.put(head, head);
        head = head.next;
    }
    
    return false;
}
