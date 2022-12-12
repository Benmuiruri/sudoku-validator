class FormatSudoku
  # Class to format the puzzle string into an array of row arrays
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.format(puzzle_string)
    puzzle_string.split("\n")
                 .map { |row| row.gsub(/\D/, '') }
                 .delete_if { |row| row.empty? }
                 .map { |row| row.chars.map(&:to_i) }
  end
end
