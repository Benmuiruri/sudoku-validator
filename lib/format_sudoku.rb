require 'pry'

class FormatSudoku
  # Class to format the puzzle string into an array of row arrays
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.format(puzzle_string)
    @rows = puzzle_string.split("\n")

    @rows.map! { |row| row.gsub(/\D/, '') }

    @rows.delete_if { |row| row.empty? }

    @rows
    
  end
end


