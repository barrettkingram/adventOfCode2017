require_relative 'spec_helper.rb'

class TestDay4 < Minitest::Test
			
	def test_input_1_1
		File.write('input.txt', "aa bb cc dd ee")
		assert_output "1\n" do 
			Day4.run_part1("input.txt")
		end
	end

	def test_input_1_2
		File.write('input.txt', "aa bb cc dd aa")
		assert_output "0\n" do
			Day4.run_part1("input.txt")
		end
	end

	def test_input_1_3
		File.write('input.txt', "aa bb cc dd aaa")
		assert_output "1\n" do
			Day4.run_part1("input.txt")
		end
	end

	def test_input_1_4
		File.write('input.txt', "1024")
		assert_output "31\n" do
			Day3.run_part1("input.txt")
		end
	end

	def test_input_2_1
		File.write('input.txt', "abcde fghij")
		assert_output "1\n" do
			Day4.run_part2("input.txt")
		end
	end	

	def test_input_2_2
		File.write('input.txt', "abcde xyz ecdab")
		assert_output "0\n" do
			Day4.run_part2("input.txt")
		end
	end

 	def test_input_2_3
		File.write('input.txt', "a ab abc abd abf abj")
		assert_output "1\n" do
			Day4.run_part2("input.txt")
		end
	end

 	def test_input_2_4
		File.write('input.txt', "iiii oiii ooii oooi oooo")
		assert_output "1\n" do
			Day4.run_part2("input.txt")
		end
	end
 
	def test_input_2_5
		File.write('input.txt', "oiii ioii iioi iiio")
		assert_output "0\n" do
			Day4.run_part2("input.txt")
		end
	end

end
