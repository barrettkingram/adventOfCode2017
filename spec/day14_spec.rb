require_relative 'spec_helper.rb'

class TestDay14 < Minitest::Test

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
      flqrgnkx
    EOF
    integration_test(input, '8108') { |file| Day14.run_part1(file) }
	end

	def test_input_2_1
    input = <<~EOF
      flqrgnkx
    EOF
    integration_test(input, '1242') { |file| Day14.run_part2(file) }
	end

end
