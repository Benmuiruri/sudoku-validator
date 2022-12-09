require_relative 'format_sudoku'

class InputValidator
  def initialize(puzzle_string)
    @puzzle_rows  = FormatSudoku.format(puzzle_string).map { |row| row.chars.map(&:to_i) }
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    valid_input?
  end

  protected

  attr_reader :puzzle_rows

  private

  def valid_input?
    puzzle_rows.length == 9 && puzzle_rows.all? { |row| row.length == 9 }
  end
end