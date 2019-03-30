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
        
        long N = in.nextLong();
        
        String digit = N+"";
        int len = digit.length();
        String output = "";
        int l = -1;
        
        //trailing zeros
        for(int j = len-1; j >=0; j--) {
        	if(digit.charAt(j)!='0') {
        		l = j;
        	    break;
        	}
        	else {
        		output+="0";
        		l--;
        	}
        }
        
        //minimum after trailing zeros - 1
        output += (Integer.parseInt(digit.charAt(l--)+"")-1);
        
        //nines
        for(int j = l; j >=0; j--) {
        	if(digit.charAt(j)!='9') {
        		l = j;
        	    break;
        	}
        	else {
        		output+="9";
        		l--;
        	}
        }
        
        //all the remaining digits + 1
        String remaining = "";
        for(int j = 0; j <= l; j++) {
        	remaining+=digit.charAt(j)+"";
            
        }
        output = (remaining == "")? "1"+output: (Integer.parseInt(remaining)+1) + output;
        
        System.out.println(output);
    }
}