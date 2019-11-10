package solutions;

import java.util.Scanner;


public class Naive {

    private static final byte[][][] MAGIC_SQUARES = {
        {
            {2, 7, 6},
            {9, 5, 1},
            {4, 3, 8}
        },
        {
            {4, 3, 8},
            {9, 5, 1},
            {2, 7, 6}
        },
        {
            {6, 7, 2},
            {1, 5, 9},
            {8, 3, 4}
        },
        {
            {8, 3, 4},
            {1, 5, 9},
            {6, 7, 2}
        },
        {
            {2, 9, 4},
            {7, 5, 3},
            {6, 1, 8}
        },
        {
            {6, 1, 8},
            {7, 5, 3},
            {2, 9, 4}
        },
        {
            {4, 9, 2},
            {3, 5, 7},
            {8, 1, 6}
        },
        {
            {8, 1, 6},
            {3, 5, 7},
            {4, 9, 2}
        }
    };

    private static byte calculateCost(byte[][] magicSquare, byte[][] square) {
        byte cost = 0;
        for (int row = 0; row < 3; row++) {
            for (int column = 0; column < 3; column++) {
                cost += Math.abs(magicSquare[row][column] - square[row][column]);
            }
        }
        return cost;
    }

    private static byte calculateMagicSquareCost(byte[][] square) {
        byte minCost = 90;
        for (int magicSquareIdx = 0; magicSquareIdx < 8; magicSquareIdx++) {
            byte cost = calculateCost(MAGIC_SQUARES[magicSquareIdx], square);
            minCost = minCost < cost ? minCost : cost;
        }
        return minCost;
    }

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        byte[][] square = new byte[3][3];
        while (sc.hasNext()) {
            for (byte row = 0; row < 3; row++) {
                for (byte column = 0; column < 3; column++) {
                    square[row][column] = sc.nextByte();
                }
            }
            System.out.println(calculateMagicSquareCost(square));
        }
    }

}