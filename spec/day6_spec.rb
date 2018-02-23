require_relative 'spec_helper.rb'

class TestDay6 < Minitest::Test
			
	def test_input_1_1
    file = Tempfile.new('input')
    begin
		  file.write("0\t2\t7\t0")
      file.close
		  assert_output "5\n" do 
			  Day6.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

	def test_input_2_1
    file = Tempfile.new('input')
    begin
		  file.write("0\t2\t7\t0")
      file.close
		  assert_output "4\n" do 
			  Day6.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end
end
