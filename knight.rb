def knight_moves(starting, ending)


end

def moves(arr)
  moves = [
    [arr.first + 2, arr.last + 1],
    [arr.first + 2, arr.last - 1],
    [arr.first - 2, arr.last + 1],
    [arr.first - 2, arr.last - 1],
    [arr.first + 1, arr.last + 2],
    [arr.first + 1, arr.last - 2],
    [arr.first - 1, arr.last + 2],
    [arr.first - 1, arr.last - 2]
  ]
  moves.select { |move| in_bounds?(move) }
end

def in_bounds?(arr)
  (0..7).include?(arr.first) && (0..7).include?(arr.last)
end

pp moves([4,4])

pp moves([0,0])
