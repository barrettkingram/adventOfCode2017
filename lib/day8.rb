class Day8

  class InstructionList
    attr_reader :max_at_end, :max_at_any_time

    def initialize(instruction_list)
      @array_of_maxes = []
      @registers = {}
      run_instructions(instruction_list)
    end

    def run_instructions(instructions)

      # initialize each register to 0
      instructions.each { |instruction| @registers[instruction[0]] = 0 }

      # convert each line to valid ruby syntax and evaluate
      # i.e. From "a inc 3 if b < 5" to "inc 'a', 3 if @registers['b'] < 5"
      instructions.each do |instruction|
        instruction[4] = "@registers['#{instruction[4]}']"
        eval "#{instruction[1]} '#{instruction[0]}', #{instruction.drop(2).join(" ")}"
        @array_of_maxes << @registers.values.max
      end

      @max_at_end = @registers.values.max
      @max_at_any_time = @array_of_maxes.max
    end

    def inc variable, amount
      @registers[variable] += amount
    end

    def dec variable, amount
      @registers[variable] -= amount
    end
  end

  def self.run_part1(file_name)
    instruction_list = InstructionList.new(open(file_name).readlines.map(&:split))
    puts instruction_list.max_at_end
  end

  def self.run_part2(file_name)
    instruction_list = InstructionList.new(open(file_name).readlines.map(&:split))
    puts instruction_list.max_at_any_time
  end

end
