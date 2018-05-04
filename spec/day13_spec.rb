require_relative 'spec_helper.rb'

class TestDay13 < Minitest::Test

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
      0: 3
      1: 2
      4: 4
      6: 4
    EOF
    integration_test(input, 24) { |file| Day13.run_part1(file) }
	end

	def test_input_2_1
    input = <<~EOF
      0: 3
      1: 2
      4: 4
      6: 4
    EOF
    integration_test(input, 10) { |file| Day13.run_part2(file) }
	end

end
