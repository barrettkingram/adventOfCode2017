class Day1
	def self.run_part1(file_name)
		input_arr = File.read(file_name).strip.split('')
		i, total = 0, 0
		while i < input_arr.count - 1
			if input_arr[i] == input_arr[i+1]
				total += input_arr[i].to_i
			end
			i += 1
		end
		if input_arr[0] == input_arr[i]
			total += input_arr[0].to_i
		end
		puts total
	end

	def self.run_part2(file_name)
		input_arr = File.read(file_name).strip.split('')
		i, total = 0, 0
		while i < input_arr.count
			if input_arr[i] == input_arr[(i+input_arr.count/2)%input_arr.count]
				total += input_arr[i].to_i
			end
			i += 1
		end
		puts total
	end
		
end
