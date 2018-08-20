class Day17

# Part 1
  class SpinLock
    def initialize(step_size)
      @buffer = [0]
      @current_position = 0
      @step_size = step_size
    end

    def spin!(value)
      position = (@current_position + @step_size) % @buffer.size
      @buffer.insert(position + 1, value)
      @current_position = position + 1
    end

    def value_after_last_insert
      @buffer[(@current_position + 1) % @buffer.size]
    end

    def value_after_zero
      @buffer[@buffer.first_index(0)]
    end
  end

  def self.run_part1(file_name)
    step_size = File.read(file_name).strip.to_i
    spinlock = SpinLock.new(step_size)
    1.upto(2017).each { |value| spinlock.spin! value }
    puts spinlock.value_after_last_insert
  end

# *****************************************************************************
# Part 2

  class EfficientSpinLock
    def initialize(step_size)
      @buffer = CircularLinkedList.new(0)
      @step_size = step_size
    end

    def spin!(value)
      @step_size.times { @buffer.advance_current_position }
      @buffer.insert_after_current(value)
      @buffer.advance_current_position
    end

    def value_after_zero
      @buffer.get(1)
    end
  end

  def self.run_part2(file_name)
    step_size = File.read(file_name).strip.to_i
    spinlock = EfficientSpinLock.new(step_size)
    1.upto(50000000).each { |value| spinlock.spin! value }
    puts spinlock.value_after_zero
  end
end
