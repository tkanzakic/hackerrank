// Solution to problem https://www.hackerrank.com/challenges/ctci-is-binary-search-tree

/* The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

boolean areNodesValueLowerThan(Node root, int value) {
    if (root == null) {
        return true;
    }
    
    return root.data < value 
        && areNodesValueLowerThan(root.left, value) 
        && areNodesValueLowerThan(root.right, value);
}

boolean areNodesValueBiggerThan(Node root, int value) {
    if (root == null) {
        return true;
    }
    
    return root.data > value 
        && areNodesValueBiggerThan(root.left, value) 
        && areNodesValueBiggerThan(root.right, value);
}

boolean checkBST(Node root) {
    if (root == null) {
        return true;
    }
    
    return areNodesValueLowerThan(root.left, root.data)
        && areNodesValueBiggerThan(root.right, root.data)
        && checkBST(root.left)
        && checkBST(root.right);
}
