require_relative 'input_validator'
require_relative 'zero_validator'
require_relative 'unique_validator'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    if valid? && complete?
      "Sudoku is valid but incomplete."
    elsif invalid?
      "Sudoku is invalid."
    else
      "Sudoku is valid."
    end
  end

  private

  def valid?
    InputValidator.validate(@puzzle_string) && UniqueValidator.validate(@puzzle_string)
  end

  def complete?
    ZeroValidator.validate(@puzzle_string)
  end

  def invalid?
    !valid?
  end
end
