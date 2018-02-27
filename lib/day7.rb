class Day7
  
  class Tower

    def initialize(input_lines)
      @program_list = input_lines.collect { |line| Program.new(line) }
      @base = treeify
    end

    def get_base_name
      @base.name
    end

    # Traverse the path of unblanced programs until we get to one with balanced children
    # -- this will be the incorrectly weighted program that needs to be rebalanced
    def get_corrected_weight
      unbalanced_program = @base.get_unbalanced_sub_program
      unbalanced_parent = @base
      loop do
        if unbalanced_program.sub_programs_balanced?
          return unbalanced_parent.get_proper_sub_program_balance(unbalanced_program)
        else
          unbalanced_parent = unbalanced_program
          unbalanced_program = unbalanced_program.get_unbalanced_sub_program
        end
      end
    end

    private
    # convert the flat array of programs into tree, returning the base of the tree
    def treeify
      base = nil
      @program_list.each do |program|
        program_parent = find_parent(program.name)
        if program_parent == nil
          base = program
        else
          program_parent.add_sub_program(program)
        end
      end
      base.add_total_weights
      base
    end

    def find_parent(program_name)
      # Find program in program array which contains the given parameter as a sub-program
      @program_list.find { |program| program.sub_program_names.include?(program_name) }
    end

  end

  class Program
    attr_reader :name, :sub_program_names, :weight, :total_weight

    def initialize(input_line)
      # input line looks like: "abc (123) -> def, ghi, jkl"
      words = input_line.split

      @name = words[0]

      # strip parentheses from weight
      @weight = words[1].gsub(/[()]/, '').to_i

      # grab everything after the '->' and strip off the commas
      if words.size > 2
        @sub_program_names = words[3..words.size].map { |word| word.sub(/,/, '') }
      else
        @sub_program_names = []
      end

      # Array where we will store the sub-programs as we discover them
      @sub_programs = []
    end

    def add_sub_program(program)
      @sub_programs.push(program)
    end

    # Recursively sum up the weights of the tree to get the total weight of each subtree
    def add_total_weights
      if @sub_programs.empty?
        @total_weight = @weight
      else
        @total_weight = @weight + @sub_programs.inject(0) do |sum, program| 
          sum + program.add_total_weights
        end
      end
      @total_weight
    end

    # Get the program repeated in the array the least amount of times - This will be our
    # unbalanced program since the balanced ones should have duplicates
    def get_unbalanced_sub_program
      @sub_programs.min_by do |program| 
        @sub_programs.count { |p| p.total_weight == program.total_weight }
      end
    end

    # Check that either no sub-programs exist or they all have the same total weight
    def sub_programs_balanced?
      duplicate_count = @sub_programs.count do |program| 
        program.total_weight == @sub_programs[0].total_weight
      end
      duplicate_count == 0 || duplicate_count == @sub_programs.size
    end

    def get_proper_sub_program_balance(unbalanced_program)
      balanced_program = @sub_programs.max_by do |program| 
        @sub_programs.count { |p| p.total_weight == program.total_weight }
      end
      balanced_program.total_weight - unbalanced_program.total_weight + unbalanced_program.weight
    end
  end

  def self.run_part1(file_name)
    tower = Tower.new(File.open(file_name).readlines)
    puts tower.get_base_name
  end

  def self.run_part2(file_name)
    tower = Tower.new(File.open(file_name).readlines)
    puts tower.get_corrected_weight
  end

end
