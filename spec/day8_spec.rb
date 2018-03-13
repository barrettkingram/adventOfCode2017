require_relative 'spec_helper.rb'

class TestDay8 < Minitest::Test
			
	def test_input_1_1
    file = Tempfile.new('input')
    begin
		  file.write <<-EOF
        b inc 5 if a > 1
        a inc 1 if b < 5
        c dec -10 if a >= 1
        c inc -20 if c == 10
      EOF
      file.close
		  assert_output "1\n" do 
			  Day8.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

	def test_input_2_1
    file = Tempfile.new('input')
    begin
		  file.write <<-EOF
        b inc 5 if a > 1
        a inc 1 if b < 5
        c dec -10 if a >= 1
        c inc -20 if c == 10
      EOF
      file.close
		  assert_output "10\n" do 
			  Day8.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end
end
