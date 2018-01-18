class Day2
	def self.run_part1(file_name)
		line_arr = File.read(file_name).strip.split("\n")
		col_arr = Array.new
		line_arr.each do |line|
			col_arr << line.split("\t").map(&:to_i)
		end

		sum = 0
		col_arr.each do |line|
			sum += (line.max.to_i - line.min.to_i)
		end
		puts sum
	end

	def self.run_part2(file_name)
		line_arr = File.read(file_name).strip.split("\n")
		col_arr = Array.new
		line_arr.each do |line|
			col_arr << line.split("\t").map(&:to_i)
		end

		sum = 0
		col_arr.each do |line|
			sum += div_result(line)
		end
		puts sum
	end

	def self.div_result(array)
		i = 0
		while i < array.size
			j = 0
			while j < array.size
				if j != i && array[i] % array[j] == 0
					return array[i] / array[j]
				end
				j += 1
			end
			i += 1
		end
	end
end
