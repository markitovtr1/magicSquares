#!/usr/bin/python3

import itertools

for square in itertools.permutations(range(1, 10)):
    for row in range(3):
        print(square[row * 3], square[row * 3 + 1], square[row * 3 + 2])