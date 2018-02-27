require_relative 'spec_helper.rb'

class TestDay7 < Minitest::Test
			
	def test_input_1_1
    file = Tempfile.new('input')
    begin
		  file.write("fwft (72) -> ktlj, cntj, xhth")
      file.close
		  assert_output "fwft\n" do 
			  Day7.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

	def test_input_1_2
    file = Tempfile.new('input')
    begin
		  file.write <<-EOF
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)
      EOF
      file.close
		  assert_output "tknk\n" do 
			  Day7.run_part1(file.path)
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
        ebii (61)
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (62)
      EOF
      file.close
		  assert_output "61\n" do 
			  Day7.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

	def test_input_2_2
    file = Tempfile.new('input')
    begin
		  file.write <<-EOF
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)
      EOF
      file.close
		  assert_output "60\n" do 
			  Day7.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

	def test_input_2_3
    file = Tempfile.new('input')
    begin
		  file.write <<-EOF
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (60) -> gyxo, ebii, jptl
        gyxo (61) -> abcd, qwer
        cntj (57)
        abcd (20)
        qwer (20)
      EOF
      file.close
		  assert_output "21\n" do 
			  Day7.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
	end

end
