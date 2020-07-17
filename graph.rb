# frozen_string_literal: true

class Graph
  def initialize(coord_array)
    @tail = coord_array[-1]
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
    legal_moves = moves.select { |move| in_bounds?(move) }
    legal_moves
  end

  def in_bounds?(arr)
    (0..7).include?(arr.first) && (0..7).include?(arr.last)
  end
end
