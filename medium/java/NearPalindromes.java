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
        int N = in.nextInt();
        if (in.hasNextLine()) {
            in.nextLine();
        }
        String output = "";
        String word = "";
        for (int i = 0; i < N; i++) {
            
            word = in.nextLine();
            word = word.toLowerCase();
            
            //suppose it is palindrome
            int palindrome = 1;
            
            int j = 0; int k = word.length()-1;
            
            //check if palindrome
            while(j<k) {
                if(word.charAt(j)!=word.charAt(k)) {
                    /*do replacement, addition or removal
                    for substring of the word*/
                    int remleft = palindrome(word, (j+1), k);
                    int remright = palindrome(word, j, (k-1));
                    int replace = palindrome(word, (j+1), (k-1));
                    
                    //if 0, then neither case is it a palindrome
                    if((remleft+remright+replace)==0) {
                        palindrome=0;
                    }
                    break;
                }
                j++; k--;
            }
       
            output+=palindrome;
        }
        System.out.println(output);
    }
    
    static int  palindrome(String w, int j, int k){
        while(j<k) {
            if(w.charAt(j)!=w.charAt(k)) return 0;
            j++; k--;
        }
        return 1;
    }
}