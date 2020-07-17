# frozen_string_literal: true

class Knight
  attr_reader :position, :ending
  attr_accessor :paths, :shortest

  def initialize(position, ending)
    @position = position
    @paths = []
    @ending = ending
    @shortest = nil
  end

  def moves(co_ords = position)
    moves = [
      [co_ords[-1].first + 2, co_ords[-1].last + 1],
      [co_ords[-1].first + 2, co_ords[-1].last - 1],
      [co_ords[-1].first - 2, co_ords[-1].last + 1],
      [co_ords[-1].first - 2, co_ords[-1].last - 1],
      [co_ords[-1].first + 1, co_ords[-1].last + 2],
      [co_ords[-1].first + 1, co_ords[-1].last - 2],
      [co_ords[-1].first - 1, co_ords[-1].last + 2],
      [co_ords[-1].first - 1, co_ords[-1].last - 2]
    ]
    legal_moves = moves.select { |move| in_bounds?(move) && !co_ords.include?(move) }
    test = legal_moves.each.map { |elt| co_ords.dup << elt }
    self.paths += test
  end

  def nested_moves(paths = self.paths)
    paths.each { |idx| moves(idx) }
  end

  def in_bounds?(co_ords)
    (0..7).include?(co_ords.first) && (0..7).include?(co_ords.last)
  end

  def print_moves
    paths.each { |elt| p elt }
  end

  def find_ending
    result = nil
    paths.reverse.each do |elt|
      result = elt if elt.include?(ending)
    end
    self.shortest = result
  end

  def find_path
    moves([position])
    final_output if shortest

    until shortest
      nested_moves
      find_ending
    end
    final_output
  end

  def final_output
    puts "You made it in #{shortest.length - 1} moves! Here's your path:"
    shortest.each { |idx| p idx }
  end
end

knight = Knight.new([0, 0], [3, 3])
knight.find_path
knight.print_moves

p knight.paths.length
