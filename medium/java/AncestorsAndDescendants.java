import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int count = in.nextInt();
        
        Node first = new Node(null);
        Node t = first;
        
        for (int i = 0; i < count; i++) {
            String line = in.nextLine();
            
            if(first.v == null) {
            	first.v = in.nextLine();
            	continue;
            }
            
            //number of dots of the current line
            int dots = 0;
            for(int j = 0; j < line.length(); j++) {
                if(line.charAt(j) == '.') dots++;
            }
            
            Node current = new Node(line);
            
            //number of dots of the previous line
            int pdots;
            if(t == null) {
            	pdots = 0;
            }
            else {
            	pdots = Node.dots(t);
            }
            
            //if current dots are less than previous dots
            //print the list
            //replace node that has pdots with current node and delete next nodes
            //else add new node to the list
            if(dots<=pdots) {
            	Node.printList(first);
                first = Node.replace(first, current, dots);
                t = first;
                while(t.next!=null) t = t.next;
            }
            else {
                t = Node.addNode(t, current);
            }
        }
        Node.printList(first); 
    }
}

class Node {
    Node prev;
    Node next;
    String v;
    
    public Node(String v) {
        this.v=v;
    }
    
    public static Node addNode(Node t, Node node) {
        t.next = node;
        node.prev = t;
        node.next = null;
        t = node;
        return t;
    }
    
    public static Node replace(Node first, Node current, int dots) {
    	Node t = first;
    	while(dots(t)!=dots(current)) t = t.next;
    	t.next = null;
    	t.v = current.v;
    	return first;
    	
    }
    
    public static int dots(Node node) {
        int sum = 0;
        int len = node.v.length();
        for(int j = 0; j < len; j++) {
            if(node.v.charAt(j) == '.') sum++;
        }
        return sum;
    }
    
    public static void printList(Node first) {
    	
    	String output = "";
    	
        while(first!=null) {
            String o = first.v.substring(first.v.lastIndexOf(".")+1, first.v.length());
            if(first.next == null) {
            	output+=o;
            }
            else output+=o+=" > ";
            first = first.next;
        }
        System.out.println(output);
    }
}