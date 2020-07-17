class Knight
  attr_reader :position
  attr_accessor :paths

  def initialize(position)
    @position = position
    @paths = [position]
  end

  def moves(co_ords)
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
    self.paths = legal_moves.each.map { |elt| co_ords.dup << elt}
  end

  def nested_moves(paths = self.paths)
    paths.each {|idx| moves(idx)}
  end

  def in_bounds?(co_ords)
    (0..7).include?(co_ords.first) && (0..7).include?(co_ords.last)
  end

  def print_moves
    paths.each { |elt| p elt }
  end

end

knight = Knight.new([0,0])
knight.moves([[0,0]])
knight.nested_moves
knight.print_moves
puts
knight.nested_moves
knight.print_moves
puts
knight.nested_moves
knight.print_moves
puts
knight.nested_moves
knight.print_moves
puts

p knight.paths


def moves(co_ords)
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
end
