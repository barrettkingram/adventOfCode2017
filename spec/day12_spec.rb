require_relative 'spec_helper.rb'

class TestDay12 < Minitest::Test

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
    input = <<~EOF
      0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5
    EOF
    integration_test(input, 6) { |file| Day12.run_part1(file) }
	end

	def test_input_2_1
    input = <<~EOF
      0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5
    EOF
    integration_test(input, 2) { |file| Day12.run_part2(file) }
	end

end
