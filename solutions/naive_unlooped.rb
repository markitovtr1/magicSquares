#!/usr/bin/ruby

BASE_MAGIC_SQUARES = [
    [
        [2, 7, 6],
        [9, 5, 1],
        [4, 3, 8]
    ],
    [
        [4, 3, 8],
        [9, 5, 1],
        [2, 7, 6]
    ],
    [
        [6, 7, 2],
        [1, 5, 9],
        [8, 3, 4]
    ],
    [
        [8, 3, 4],
        [1, 5, 9],
        [6, 7, 2]
    ]
]

def cost(magic_square, square)
    (magic_square[0][0] - square[0][0]).abs +
    (magic_square[0][1] - square[0][1]).abs +
    (magic_square[0][2] - square[0][2]).abs +
    (magic_square[1][0] - square[1][0]).abs +
    (magic_square[1][1] - square[1][1]).abs +
    (magic_square[1][2] - square[1][2]).abs +
    (magic_square[2][0] - square[2][0]).abs +
    (magic_square[2][1] - square[2][1]).abs +
    (magic_square[2][2] - square[2][2]).abs
end

def magic_square_cost(square)
    [
        cost(@all_magic_squares[0], square),
        cost(@all_magic_squares[1], square),
        cost(@all_magic_squares[2], square),
        cost(@all_magic_squares[3], square),
        cost(@all_magic_squares[4], square),
        cost(@all_magic_squares[5], square),
        cost(@all_magic_squares[6], square),
        cost(@all_magic_squares[7], square)
    ].min
end

@all_magic_squares = []
@all_magic_squares.concat(BASE_MAGIC_SQUARES);
BASE_MAGIC_SQUARES.each { |ms| @all_magic_squares.push(ms.transpose) }

square = []
curr_row = 0
while row = gets do
    row = row.chomp.split("\s")
    square[curr_row] = row.map(&:to_i)
    curr_row += 1
    if curr_row == 3
        puts magic_square_cost(square)
        curr_row = 0
    end
end
