class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    # Your code here
    # step 1: Format the puzzle string to get the rows
    # step 2: validate the rows and columns to make sure they are valid (length should be 9 and no duplicates)
    # step 3: if puzzle string is valid, check if it is complete or not (if it has any zeros) 
  end
end
