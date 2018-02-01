require_relative 'spec_helper.rb'

class TestDay1 < Minitest::Test
			
	def test_input_1_1
		File.write('input.txt', '1122')
		assert_output "3\n" do 
			Day1.run_part1("input.txt")
		end
	end

	def test_input_1_2
		File.write('input.txt', '1111')
		assert_output "4\n" do
			Day1.run_part1("input.txt")
		end
	end

	def test_input_1_3
		File.write('input.txt', '1234')
		assert_output "0\n" do
			Day1.run_part1("input.txt")
		end
	end

	def test_input_1_4
		File.write('input.txt', '91212129')
		assert_output "9\n" do
			Day1.run_part1("input.txt")
		end
	end

	def test_input_2_1
		File.write('input.txt', '1212')
		assert_output "6\n" do
			Day1.run_part2("input.txt")
		end
	end
	
	def test_input_2_2
		File.write('input.txt', '1221')
		assert_output "0\n" do
			Day1.run_part2("input.txt")
		end
	end
	
	def test_input_2_3
		File.write('input.txt', '123425')
		assert_output "4\n" do
			Day1.run_part2("input.txt")
		end
	end
	
	def test_input_2_4
		File.write('input.txt', '123123')
		assert_output "12\n" do
			Day1.run_part2("input.txt")
		end
	end
	
	def test_input_2_5
		File.write('input.txt', '12131415')
		assert_output "4\n" do
			Day1.run_part2("input.txt")
		end
	end
	

end
