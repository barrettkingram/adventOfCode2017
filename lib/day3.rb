class Day3
	def self.run_part1(file_name)
		square_coord = File.read(file_name).strip
		pairs = (1..Math.sqrt(square_coord.to_i).ceil).map do |x| 
			arr = Array.new
			x.times { arr << [1, 0] }
			x.times { arr << [0, 1] }
			arr
		end
    pairs.insert(0, [[0, 0]])
    alternating = Array.new
    pairs.each_with_index do |pair, index|
      if index % 2 == 0 
        alternating << pair.map { |x| [x[0]*-1, x[1]*-1] }
      else
        alternating << pair
      end
    end
		xysum = alternating.flatten(1).first(square_coord.to_i)
      .inject([0,0]) { |sum, arr| [sum[0] + arr[0], sum[1] + arr[1]] }
    puts xysum[0].abs + xysum[1].abs
	end

	def self.run_part2(file_name)
		target = File.read(file_name).strip
    starting_address = MemoryAddress.new(:east, Hash.new)
    starting_address.value = 1
    next_address = MemoryAddress.new(:east, { :west => starting_address } )
    starting_address.surrounding_cells[:east] = next_address
    while (next_address.value < target.to_i)
      next_address = next_address.get_next_address 
    end
    puts next_address.value
  end

  class MemoryAddress
    attr_accessor :value, :surrounding_cells

    def initialize(direction, surrounding_cells)
      @next_direction = get_next_direction(direction, surrounding_cells)
      @value = get_value(surrounding_cells)
      @surrounding_cells = surrounding_cells
    end

    def get_next_address
      new_address = MemoryAddress.new(@next_direction, get_surrounding(@next_direction))
      @surrounding_cells[@next_direction] = new_address
      new_address
    end

    private
    def get_next_direction(direction, surrounding_cells)
      left_direction = turn_left(direction)
      if !surrounding_cells.has_key?(left_direction)
        left_direction
      else
        direction
      end
    end

    def get_value(cells)
      cells.values.inject(0) { |sum, x| sum + x.value }
    end

    def turn_left(direction)
      if direction == :east
        :north
      elsif direction == :north
        :west
      elsif direction == :west
        :south
      else
        :east
      end
    end

    def get_surrounding(next_direction)
      next_surrounding = Hash.new
      if next_direction == :east
        next_surrounding[:west] = self
        next_surrounding[:northwest] = @surrounding_cells[:north]
        next_surrounding[:north] = @surrounding_cells[:northeast]
        if @surrounding_cells[:northeast] != nil
          next_surrounding[:northeast] = @surrounding_cells[:northeast]
            .surrounding_cells[:east]
        end
      elsif next_direction == :north
        next_surrounding[:south] = self
        next_surrounding[:southwest] = @surrounding_cells[:west]
        next_surrounding[:west] = @surrounding_cells[:northwest]
        if @surrounding_cells[:northwest] != nil
          next_surrounding[:northwest] = @surrounding_cells[:northwest]
            .surrounding_cells[:north]
        end
      elsif next_direction == :west
        next_surrounding[:east] = self
        next_surrounding[:southeast] = @surrounding_cells[:south]
        next_surrounding[:south] = @surrounding_cells[:southwest]
        if @surrounding_cells[:southwest] != nil
          next_surrounding[:southwest] = @surrounding_cells[:southwest]
            .surrounding_cells[:west]
        end
      elsif next_direction == :south
        next_surrounding[:north] = self
        next_surrounding[:northeast] = @surrounding_cells[:east]
        next_surrounding[:east] = @surrounding_cells[:southeast]
        if @surrounding_cells[:southeast] != nil
          next_surrounding[:southeast] = @surrounding_cells[:southeast]
            .surrounding_cells[:south]
        end
      end
      next_surrounding.delete_if { |k, v| v.nil? }
    end
  end
end
