package solutions;

import java.util.Scanner;
import java.util.Collections;
import java.util.Arrays;


public class NaiveUnlooped {

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
        int a = Math.abs(magicSquare[0][0] - square[0][0])
            + Math.abs(magicSquare[0][1] - square[0][1])
            + Math.abs(magicSquare[0][2] - square[0][2])
            + Math.abs(magicSquare[1][0] - square[1][0])
            + Math.abs(magicSquare[1][1] - square[1][1])
            + Math.abs(magicSquare[1][2] - square[1][2])
            + Math.abs(magicSquare[2][0] - square[2][0])
            + Math.abs(magicSquare[2][1] - square[2][1])
            + Math.abs(magicSquare[2][2] - square[2][2]);
        return (byte) a;
    }

    private static byte calculateMagicSquareCost(byte[][] square) {
        Byte[] costs = {
            calculateCost(MAGIC_SQUARES[0], square),
            calculateCost(MAGIC_SQUARES[1], square),
            calculateCost(MAGIC_SQUARES[2], square),
            calculateCost(MAGIC_SQUARES[3], square),
            calculateCost(MAGIC_SQUARES[4], square),
            calculateCost(MAGIC_SQUARES[5], square),
            calculateCost(MAGIC_SQUARES[6], square),
            calculateCost(MAGIC_SQUARES[7], square)
        };
        return Arrays.stream(costs).min(Byte::compare).get();
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