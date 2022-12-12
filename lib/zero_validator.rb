require_relative 'format_sudoku'

class ZeroValidator
  # Class to check if there are any zeroes in the puzzle
  def initialize(puzzle_string)
    @puzzle_rows = FormatSudoku.format(puzzle_string)
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    contains_zero?
  end

  protected

  attr_reader :puzzle_rows

  private

  def contains_zero?
    puzzle_rows.flatten.include?(0)
  end
end