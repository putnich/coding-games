import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Don't let the machines win. You are humanity's last hope...
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int width = in.nextInt(); // the number of cells on the X axis
        int height = in.nextInt(); // the number of cells on the Y axis
        if (in.hasNextLine()) {
            in.nextLine();
        }
        
        String input = "";
        
        for (int i = 0; i < height; i++) {
            String line = in.nextLine(); // width characters, each either 0 or .
            input+=line;
        }
        
        char[] grid = input.toCharArray();
        
        String output = ""; 
        int len = grid.length;
        for (int i = 0; i < len; i++) {
            //if connection
            if(grid[i]!='0') ;
            else {
                //calculate location in the grid
                int y = i / width;
                int x = (i+width)%width;
                
                //add current node
                output = x+" "+y;
                
                //suppose there is no right
                String rightn = " -1 -1";
                
                //if not rightmost node
                if(x<width-1) {
                    int r = 1;
                    
                    //loop through all right nodes of the current node
                    //and if connection exist
                    //calculate the coordinates for the nearest right
                    while(r<width-x) {
                        if(grid[i+r]=='0') {
                            int yr = (i+r) / width;
                            int xr = ((i+r)+width)%width;
                            rightn=" "+xr+" "+yr;
                            break;
                        }
                        r++;
                    }
                }
                output+=rightn;
                
                //suppose no bottom neighbour 
                String bottomn = " -1 -1";
                
                //if not bottommost node 
                if(y<height-1) {
                    int b = 1;
                    
                    //loop thorugh all bottom nodes of the current node
                    //and if connection exist
                    //calculate the coordinates for the nearest bottom
                    while(b<height-y) {
                        if(grid[i+b*width]=='0') {
                            int xb = (i+b*width) / width;
                            int yb = ((i+b*width)+width)%width;
                            bottomn=" "+yb+" "+xb;
                            break;
                        }
                        b++;
                    }
                }
                output+=bottomn;
                System.out.println(output);
            }
        }
    }
}