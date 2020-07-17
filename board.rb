# frozen_string_literal: true

def board
  row = Array(0..7)
  col = []
  8.times { col << Array(0..7) }
  col
end

def knight(x, y)
  position = [x, y]
end
pp board

def place_knight(x, y, board)
  board[x][y] = 'K'
  board
end

new_board = board
pp place_knight(4, 4, new_board)
