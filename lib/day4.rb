class Day4
	def self.run_part1(file_name)
		lines = File.open(file_name).readlines.map { |line| line.strip.split(" ") }

    unique_count = lines.count { |line| line.uniq == line }

    puts unique_count
	end

  def self.run_part2(file_name)
		lines = File.open(file_name).readlines.map { |line| line.strip.split(" ") }
    valid_count = lines.count do |line|
      permutations = line.collect_concat { |word| word.chars.permutation.map(&:join).uniq }
      permutations.uniq == permutations
    end
    puts valid_count
  end
end
