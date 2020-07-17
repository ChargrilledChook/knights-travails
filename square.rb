require 'pp'

class Square
  attr_reader :position, :moves, :depth, :vertices

  @@vertices = []

  def initialize(position, depth = 0)
    @position = position
    @depth = depth
    @moves = make_children(position)
    @@vertices << position
  end

  def check_moves(arr)
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
    legal_moves = moves.select { |move| in_bounds?(move) }#&& !vertices.include?(move) }
    #legal_moves.each { |move| vertices << move unless vertices.include?(move) }
    legal_moves
  end

  def make_children(position)
    moves = check_moves(position)
    level = depth + 1
    moves.map { |move| Square.new(move, level) unless level >= 5  } #|| vertices.include?(move)
  end

  def in_bounds?(arr)
    (0..7).include?(arr.first) && (0..7).include?(arr.last)
  end

  def to_s
    position
  end
end

pp Square.new([0, 0]).vertices
