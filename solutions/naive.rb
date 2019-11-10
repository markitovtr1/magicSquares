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
    cost = 0
    3.times do |row|
        3.times do |column|
            cost += (magic_square[row][column] - square[row][column]).abs
        end
    end
    cost
end

def magic_square_cost(square)
    min_cost = nil
    @all_magic_squares.each do |ms|
        cost = cost(ms, square)
        min_cost = (min_cost and min_cost < cost) ? min_cost : cost
    end
    min_cost
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
