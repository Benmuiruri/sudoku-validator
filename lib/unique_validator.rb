require 'pry'
require_relative 'format_sudoku'

class UniqueValidator
  def initialize(puzzle_string)
    @rows = FormatSudoku.format(puzzle_string).map { |row| row.chars.map(&:to_i) }
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
  validate_rows && validate_columns && validate_sub_grids  ? 'Sudoku is valid.' : 'Sudoku is invalid.'
end


  private

  def validate_rows
  @rows.none? do |row|
    row.select { |x| (1..9).include?(x) }.uniq.length != row.select { |x| (1..9).include?(x) }.length
  end
end

  def validate_columns
    9.times do |col|
      col_elements = @rows.map { |row| row[col] }
      return false if col_elements.select { |x| (1..9).include?(x) }.uniq.length != col_elements.select { |x| (1..9).include?(x) }.length
    end
    true
  end

  def validate_sub_grids
    3.times do |i|
      3.times do |j|
        sub_grid_elements = []
        3.times do |k|
          3.times do |l|
            sub_grid_elements << @rows[i * 3 + k][j * 3 + l]
          end
        end
        return false if sub_grid_elements.select { |x| (1..9).include?(x) }.uniq.length != sub_grid_elements.select { |x| (1..9).include?(x) }.length
      end
    end
    true
  end
end
