require_relative 'format_sudoku'

class UniqueValidator
  def initialize(puzzle_string)
    @puzzle_rows = FormatSudoku.format(puzzle_string).map { |row| row.chars.map(&:to_i) }
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    valid_rows? && valid_columns? && valid_sub_grids?
  end

  protected

  attr_reader :puzzle_rows

  private

  def valid_sequence?(seq)
    seq_numbers = seq.select { |x| (1..9).include?(x) }
    seq_numbers.uniq.length == seq_numbers.length
  end

  def valid_rows?
    puzzle_rows.any? do |row|
      valid_sequence?(row)
    end
  end

  def valid_columns?
    9.times do |col|
      col_elements = puzzle_rows.map { |row| row[col] }

      return false unless valid_sequence?(col_elements)
    end
    true
  end

  def valid_sub_grids?
    3.times do |i|
      3.times do |j|
        sub_grid_elements = []
        3.times do |k|
          3.times do |l|
            sub_grid_elements << puzzle_rows[i * 3 + k][j * 3 + l]
          end
        end

        return false unless valid_sequence?(sub_grid_elements)
      end
    end

    true
  end
end
