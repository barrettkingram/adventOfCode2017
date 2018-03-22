require_relative 'spec_helper.rb'

class TestDay9 < Minitest::Test
			
  def test_input_1_1
    file = Tempfile.new('input')
    begin
		  file.write "{}"
      file.close
		  assert_output "1\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_2
    file = Tempfile.new('input')
    begin
		  file.write "{{{}}}"
      file.close
		  assert_output "6\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_3
    file = Tempfile.new('input')
    begin
		  file.write "{{},{}}"
      file.close
		  assert_output "5\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_4
    file = Tempfile.new('input')
    begin
		  file.write "{{{},{},{{}}}}"
      file.close
		  assert_output "16\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_5
    file = Tempfile.new('input')
    begin
		  file.write "{<a>,<a>,<a>,<a>}"
      file.close
		  assert_output "1\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_6
    file = Tempfile.new('input')
    begin
		  file.write "{{<ab>},{<ab>},{<ab>},{<ab>}}"
      file.close
		  assert_output "9\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_7
    file = Tempfile.new('input')
    begin
		  file.write "{{<!!>},{<!!>},{<!!>},{<!!>}}"
      file.close
		  assert_output "9\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_1_9
    file = Tempfile.new('input')
    begin
		  file.write "{{<a!>},{<a!>},{<a!>},{<ab>}}"
      file.close
		  assert_output "3\n" do 
			  Day9.run_part1(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_1
    file = Tempfile.new('input')
    begin
		  file.write "<>"
      file.close
		  assert_output "0\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_2
    file = Tempfile.new('input')
    begin
		  file.write "<random characters>"
      file.close
		  assert_output "17\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_3
    file = Tempfile.new('input')
    begin
		  file.write "<<<<>"
      file.close
		  assert_output "3\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_4
    file = Tempfile.new('input')
    begin
		  file.write "<{!>}>"
      file.close
		  assert_output "2\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_5
    file = Tempfile.new('input')
    begin
		  file.write "<!!>"
      file.close
		  assert_output "0\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_6
    file = Tempfile.new('input')
    begin
		  file.write "<!!!>>"
      file.close
		  assert_output "0\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

  def test_input_2_7
    file = Tempfile.new('input')
    begin
		  file.write "<{o\"i!a,<{i<a>"
      file.close
		  assert_output "10\n" do 
			  Day9.run_part2(file.path)
		  end
    ensure
      file.close
      file.unlink
    end
  end

end
