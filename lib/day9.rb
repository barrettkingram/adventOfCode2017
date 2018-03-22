class Day9

  class Stream

    def initialize(input)
      @input = input
      @garbage_count = 0
    end
  
    def calculate_score
      score = 0
      bracket_matches = []

      index = 0
      while @input[index] != nil
        if @input[index] == '<'
          index = end_of_garbage(index + 1) # index = closing bracket of garbage
        elsif @input[index] == '{'
          bracket_matches.push('{')
        elsif @input[index] == '}'
          score += bracket_matches.size
          bracket_matches.pop
        end
        index += 1
      end
      score
    end

    def garbage_count
      calculate_score
      @garbage_count
    end
  
    private

    def end_of_garbage(index)
      garbage_beginning_index = index
      cancelled_character_count = 0
      loop do
        if @input[index] == '!'
          cancelled_character_count += 2
          index += 2
        elsif @input[index] == '>'
          garbage_ending_index = index
          @garbage_count += garbage_ending_index - garbage_beginning_index - cancelled_character_count
          return index
        else
          index += 1
        end
      end
    end

  end

  def self.run_part1(file_name)
    stream = Stream.new(File.read(file_name))
    puts stream.calculate_score
  end

  def self.run_part2(file_name)
    stream = Stream.new(File.read(file_name))
    puts stream.garbage_count
  end

end
