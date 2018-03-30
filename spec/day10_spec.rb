require_relative 'spec_helper.rb'

class TestDay10 < Minitest::Test
  def transform_test_helper(initial_list, initial_pos, final_list, final_pos, length, skip_size)
    circular_list = Day10::KnotHash::CircularList.new((0..4).to_a)
    circular_list.instance_variable_set("@list", initial_list)
    circular_list.instance_variable_set("@current_position", initial_pos)
    circular_list.instance_variable_set("@skip_size", skip_size)

    circular_list.transform(length)
    assert_equal circular_list.list, final_list
    assert_equal circular_list.instance_variable_get("@current_position"), final_pos
  end

  def test_list_transform_1
    transform_test_helper([0, 1, 2, 3, 4], 0, [2, 1, 0, 3, 4], 3, 3, 0)
  end

  def test_list_transform_2
    transform_test_helper([2, 1, 0, 3, 4], 3, [4, 3, 0, 1, 2], 3, 4, 1)
  end

  def test_list_transform_3
    transform_test_helper([4, 3, 0, 1, 2], 3, [4, 3, 0, 1, 2], 1, 1, 2)
  end

  def test_list_transform_4
    transform_test_helper([4, 3, 0, 1, 2], 1, [3, 4, 2, 1, 0], 4, 5, 3)
  end

  def test_knot_hash_part_1
    hash = Day10::KnotHash.new([3,4,1,5], 5)
    assert_equal hash.part1_result, 12
  end

  def test_knot_hash_part_2
    hash = Day10::KnotHash.new('')
    assert_equal hash.part2_result, 'a2582a3a0e66e6e86e3812dcb672a272'
  end

end
