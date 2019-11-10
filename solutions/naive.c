
#include <stdio.h>
#include <stdlib.h>

char MAGIC_SQUARES[8][3][3] =
{
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

char calculateCost(char magicSquare[3][3], char square[3][3]) {
    char cost = 0;
    int i, j;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            cost += abs((magicSquare[i][j] - square[i][j]));
        }
    }
    return cost;
}

char calculateMagicSquareCost(char square[3][3]) {
    char minCost = 100, cost;
    int i;
    for (i = 0; i < 8; i++) {
        cost = calculateCost(MAGIC_SQUARES[i], square);
        minCost = minCost < cost ? minCost : cost;
    }
    return minCost;
}

int main() {
    int i, j;
    char square[3][3];
    char hasStarted = 0;
    while (!feof(stdin)) {
        if (hasStarted) {
            printf("%d\n", calculateMagicSquareCost(square));
        }
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                scanf("%hhd", &square[i][j]);
            }
        }
        hasStarted = 1;
    }
}