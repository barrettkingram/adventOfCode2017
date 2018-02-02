require_relative 'spec_helper.rb'

class TestDay3 < Minitest::Test
			
	def test_input_1_1
		File.write('input.txt', "1")
		assert_output "0\n" do 
			Day3.run_part1("input.txt")
		end
	end

	def test_input_1_2
		File.write('input.txt', "12")
		assert_output "3\n" do
			Day3.run_part1("input.txt")
		end
	end

	def test_input_1_3
		File.write('input.txt', "23")
		assert_output "2\n" do
			Day3.run_part1("input.txt")
		end
	end

	def test_input_1_4
		File.write('input.txt', "1024")
		assert_output "31\n" do
			Day3.run_part1("input.txt")
		end
	end

	def test_input_2_1
		File.write('input.txt', "3")
		assert_output "4\n" do
			Day3.run_part2("input.txt")
		end
	end	

	def test_input_2_2
		File.write('input.txt', "800")
		assert_output "806\n" do
			Day3.run_part2("input.txt")
		end
	end

  def test_first_direction_east
    mem_address = Day3::MemoryAddress.new
    mem_address = mem_address.get_next_address
    assert_equal :east, mem_address.instance_variable_get("@direction")
  end

  def test_next_direction
    mem_address = Day3::MemoryAddress.new(:south, Hash.new)
    mem_address.surrounding_cells[:east] = Day3::MemoryAddress.new
    assert_equal :south, mem_address.send(:get_next_direction)
  end

  def test_get_value
    mem_address1 = Day3::MemoryAddress.new(:south, Hash.new)
    mem_address1.value = 3
    mem_address2 = Day3::MemoryAddress.new(:south, Hash.new)
    mem_address2.value = 5
    mem_address3 = Day3::MemoryAddress.new(:south, Hash.new)
    mem_address3.value = 11
    hash = { :north => mem_address1, :northwest => mem_address2, 
      :northeast => mem_address3 }
    mem_address4 = Day3::MemoryAddress.new(:south, hash)
    assert_equal 19, mem_address4.value
  end
   
end
