require_relative 'spec_helper.rb'

class TestDay2 < Minitest::Test
			
	def test_input_1_1
		File.write('input.txt', "5\t1\t9\t5")
		assert_output "8\n" do 
			Day2.run_part1("input.txt")
		end
	end

	def test_input_1_2
		File.write('input.txt', "7\t5\t3")
		assert_output "4\n" do
			Day2.run_part1("input.txt")
		end
	end

	def test_input_1_3
		File.write('input.txt', "2\t4\t6\t8")
		assert_output "6\n" do
			Day2.run_part1("input.txt")
		end
	end

	def test_input_1_4
		File.write('input.txt', "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8")
		assert_output "18\n" do
			Day2.run_part1("input.txt")
		end
	end

	def test_div_helper
		array = [4, 3, 5, 9]
		assert_equal 3, Day2.div_result(array)
	end

	def test_input_2_1
		File.write('input.txt', "5\t9\t2\t8")
		assert_output "4\n" do
			Day2.run_part2("input.txt")
		end
	end	

	def test_input_2_2
		File.write('input.txt', "9\t4\t7\t3")
		assert_output "3\n" do
			Day2.run_part2("input.txt")
		end
	end

	def test_input_2_3
		File.write('input.txt', "3\t8\t6\t5")
		assert_output "2\n" do
			Day2.run_part2("input.txt")
		end
	end

	def test_input_2_4
		File.write('input.txt', "5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5")
		assert_output "9\n" do
			Day2.run_part2("input.txt")
		end
	end
end
