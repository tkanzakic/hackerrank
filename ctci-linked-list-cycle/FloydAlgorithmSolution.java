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
    if (head == null) {
        return false;
    }
    
    Node slow = head;
    Node fast = head;
    while (true) {
        if (slow == null || fast == null) {
            break;
        }
        if (fast.next.next == null) {
            break;
        }
        else {
            fast = fast.next.next;
        }
        slow = slow.next;
        if (slow == fast) {
            return true;
        }
    }
    
    return false;
}
