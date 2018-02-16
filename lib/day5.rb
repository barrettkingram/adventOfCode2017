class Day5
	def self.run_part1(file_name)
		jump_arr = File.open(file_name).readlines.map { |x| x.strip.to_i }
    i = step_count = 0
    while i >= 0 && i < jump_arr.size
      step_count += 1
      next_i = jump_arr[i] + i
      jump_arr[i] += 1
      i = next_i
    end
    puts step_count
	end

  def self.run_part2(file_name)
		jump_arr = File.open(file_name).readlines.map { |x| x.strip.to_i }
    i = step_count = 0
    while i >= 0 && i < jump_arr.size
      step_count += 1
      next_i = jump_arr[i] + i
      if jump_arr[i] >= 3
        jump_arr[i] -= 1
      else
        jump_arr[i] += 1
      end
      i = next_i
    end
    puts step_count
  end
end
