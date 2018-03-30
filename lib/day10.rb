class Day10

  class KnotHash

    def initialize(input, list_length = 256)
      @list_length = list_length
      @lengths = input
    end

    def part1_result
      result_list = do_hash((0..@list_length-1).to_a)
      result_list[0] * result_list[1]
    end

    def part2_result
      @lengths = @lengths.bytes + [17, 31, 73, 47, 23]
      result_list = do_hash((0..@list_length-1).to_a, 64)
      dense_hash = []
      16.times do
        dense_hash << result_list.shift(16).inject(0, :^)
      end
      dense_hash.inject('') do |total, number| 
        if number < 0x10
          total += ('0' + number.to_s(16))
        else
          total += number.to_s(16) 
        end
      end
    end
  
    private

    def do_hash(list, rounds = 1)
      circular_list = CircularList.new(list)
      rounds.times do
        @lengths.each { |length| circular_list.transform(length) }
      end
      circular_list.list
    end

    class CircularList
      attr_reader :list

      def initialize(list)
        @list = list
        @current_position = 0
        @skip_size = 0
      end

      def transform(length_count)
        @list.rotate!(@current_position)
        length = @list.shift(length_count)
        @list.unshift(*length.reverse)
        @list.rotate!(-@current_position)
        @current_position = (@current_position + length_count + @skip_size) % @list.size
        @skip_size += 1
      end

    end

  end

  def self.run_part1(file_name)
    hash = KnotHash.new(File.read(file_name).split(',').map(&:to_i))
    puts hash.part1_result
  end

  def self.run_part2(file_name)
    hash = KnotHash.new(File.read(file_name).strip)
    puts hash.part2_result
  end

end
