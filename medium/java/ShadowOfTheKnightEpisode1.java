import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int W = in.nextInt(); // width of the building.
        int H = in.nextInt(); // height of the building.
        int N = in.nextInt(); // maximum number of turns before game over.
        int X0 = in.nextInt();
        int Y0 = in.nextInt();
        int lowX = 0;
        int lowY = 0;
        int highX = W;
        int highY = H;

        // game loop
        while (true) {
            String bombDir = in.next(); // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
            /*setting low and high X and Y depending on 
            //current location and direction so that
            we can narrow down the search*/
            if(bombDir.contains("U")) {
                highY = Y0;
            }
            if (bombDir.contains("L")) {
                highX = X0;
            }
            if(bombDir.contains("R")) {
                lowX = X0;
            }
            if(bombDir.contains("D")) {
                lowY = Y0;
            }
            
            //updating coordinates
            X0=lowX + (highX-lowX) / 2;
            Y0=lowY + (highY-lowY) / 2;
            
            /* or X0=(highX+lowX) / 2;
            Y0=(highY+lowY) / 2; since it is equivalent with above*/
            

            // the location of the next window Batman should jump to.
            System.out.println(X0+" " +Y0);
        }
    }
}