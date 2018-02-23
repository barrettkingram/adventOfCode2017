class Day6
  
  class MemorySegment
  
    def initialize(initial_memory_segment, part)
      @current_state = initial_memory_segment
      @state_history = [@current_state]
      @redistribution_count = 0
      @part = part
    end

    def redistribute_until_repeat
      next_state = redistribute(@current_state)
      @redistribution_count += 1
      if @state_history.include?(next_state)
        if @part == 1
          @redistribution_count
        else
          @redistribution_count - @state_history.find_index(next_state)
        end
      else
        @state_history.push(next_state)
        @current_state = next_state
        redistribute_until_repeat
      end
    end

    def redistribute(memory_segment)
      new_memory_segment = memory_segment.clone
      max_value = new_memory_segment.max
      current_index = new_memory_segment.find_index(max_value)

      new_memory_segment[current_index] = 0
      current_index += 1
      max_value.downto(1) do
        new_memory_segment[current_index % new_memory_segment.size] += 1
        current_index += 1
      end
      new_memory_segment
    end

  end

  def self.run_part1(file_name)
    memory_segment = MemorySegment.new(File.open(file_name).read.split.map(&:to_i), 1)
    redistribution_count = memory_segment.redistribute_until_repeat
    puts redistribution_count
  end

  def self.run_part2(file_name)
    memory_segment = MemorySegment.new(File.open(file_name).read.split.map(&:to_i), 2)
    distance = memory_segment.redistribute_until_repeat
    puts distance
  end

end
