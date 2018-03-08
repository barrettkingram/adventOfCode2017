class Day8

  def self.inc variable, amount
    instance_variable_set(variable, instance_variable_get(variable) + amount)
  end

  def self.dec variable, amount
    instance_variable_set(variable, instance_variable_get(variable) - amount)
  end

  def self.run_part1(file_name)
    instructions = File.open(file_name).readlines.map(&:split)

    # initialize each register to 0
    instructions.each { |instruction| eval "@#{instruction[0]} = 0" }

    # convert each line to valid ruby syntax and evaluate
    # i.e. From "a inc 3 if b < 5" to "inc :@a, 3 if @b < 5"
    instructions.each do |instruction|
      instruction[4] = "@#{instruction[4]}"
      eval "#{instruction[1]} :@#{instruction[0]}, #{instruction.drop(2).join(" ")}"
    end
    puts instance_variables.map { |variable| instance_variable_get(variable) }.max
  end

  def self.run_part2(file_name)
    test
  end

end
