require_relative 'format_sudoku'

class InputValidator
  def initialize(puzzle_string)
    @rows = FormatSudoku.format(puzzle_string).map { |row| row.chars.map(&:to_i) }
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    validate_rows ? 'Sudoku is valid.' : 'Sudoku is invalid.'
  end

  private

  def validate_rows
    @rows.length == 9 && @rows.all? { |row| row.length == 9 }
  end
end