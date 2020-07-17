# frozen_string_literal: true

class Knight
  attr_reader :vertices, :position

  def initialize(position)
    @position = position
    @vertices = [position]
  end

  def knight_moves(starting, _ending)
    tree = [starting]
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
    legal_moves = moves.select { |move| in_bounds?(move) && !vertices.include?(move) }
    legal_moves.each { |move| vertices << move unless vertices.include?(move) }
    legal_moves
  end

  def in_bounds?(arr)
    (0..7).include?(arr.first) && (0..7).include?(arr.last)
  end

  def move_chain(root = position)
    first = moves(root)
    second = first.map { |elt| moves(elt) }
    third = second[0].map { |elt| moves(elt) }
    third2 = second[1].map { |elt| moves(elt) }
    third += third2
    third.flatten(1).uniq
  end
end

knight = Knight.new([0, 0])

knight.move_chain

p knight.vertices.sort
