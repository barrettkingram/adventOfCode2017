require_relative 'spec_helper.rb'

class TestDay11 < Minitest::Test

  def integration_test(input, result)
    file = Tempfile.new('input')
	   begin
		  file.write input
      file.close
		  assert_output "#{result}\n" do 
        yield file.path
		  end
    ensure
      file.close
      file.unlink
    end
  end
		
	def test_input_1_1
    integration_test("ne,ne,ne", 3) { |file| Day11.run_part1(file) }
	end

	def test_input_1_2
    integration_test("ne,ne,sw,sw", 0) { |file| Day11.run_part1(file) }
	end

	def test_input_1_3
    integration_test("ne,ne,s,s", 2) { |file| Day11.run_part1(file) }
	end

	def test_input_1_4
    integration_test("se,sw,se,sw,sw", 3) { |file| Day11.run_part1(file) }
	end

	def test_input_2_1
    integration_test("ne,ne,ne", 3) { |file| Day11.run_part2(file) }
	end

	def test_input_2_2
    integration_test("ne,ne,sw,sw", 2) { |file| Day11.run_part2(file) }
	end

	def test_input_2_3
    integration_test("ne,ne,s,s", 2) { |file| Day11.run_part2(file) }
	end

	def test_input_2_4
    integration_test("se,sw,se,sw,sw", 3) { |file| Day11.run_part2(file) }
	end

end
