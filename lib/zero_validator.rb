require 'pry'
require_relative 'format_sudoku'

class ZeroValidator
  def initialize(puzzle_string)
    @rows = FormatSudoku.format(puzzle_string).map { |row| row.chars.map(&:to_i) }
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    contains_zero?
  end

  private

  def contains_zero?
    @rows.flatten.include?(0)
  end
end