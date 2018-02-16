require_relative 'spec_helper.rb'

class TestDay5 < Minitest::Test
			
	def test_input_1_1
		File.write('input.txt', "0\n3\n0\n1\n-3")
		assert_output "5\n" do 
			Day5.run_part1("input.txt")
		end
	end

	def test_input_2_1
		File.write('input.txt', "0\n3\n0\n1\n-3")
		assert_output "10\n" do
			Day5.run_part2("input.txt")
		end
	end
end
