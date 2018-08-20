class Day14
  class Grid
    def initialize(key)
      hash_keys = (0..127).to_a.collect { |num| "#{key}-#{num}" }
      hash_values = hash_keys.collect { |key| Day10::KnotHash.new(key).part2_result }
      @grid = hash_values.collect { |hex_string| hex_string.chars.collect { |hex_char| sprintf('%04b', hex_char.to_i(16)) }.inject('', :+).chars }
    end

    def count_used
      @grid.inject(0) { |sum, row| sum += row.count { |char| char == '1' } }
    end

    def count_regions
      count = 1
      while region_start = get_next_region
        count += 1
        mark_region(region_start, count.to_s)
      end
      count - 1
    end

    private

    def get_next_region
      @grid.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          return [row_index, col_index] if col == '1'
        end
      end
      return nil
    end

    def mark_region(start_coord, mark_char)
      @grid[start_coord[0]][start_coord[1]] = mark_char
      explore_list = [start_coord]
      while coord = explore_list.shift
        [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |offset|
          neighbor = [coord[0] + offset[0], coord[1] + offset[1]]
          if neighbor[0] >= 0 && neighbor[1] >= 0 && neighbor[0] < 128 && neighbor[1] < 128 && @grid[neighbor[0]][neighbor[1]] == '1'
            @grid[neighbor[0]][neighbor[1]] = mark_char
            explore_list << [neighbor[0], neighbor[1]]
          end
        end
      end
    end
  end

  def self.run_part1(file_name)
    key = File.read(file_name).strip
    grid = Grid.new(key)
    puts grid.count_used
  end

  def self.run_part2(file_name)
    key = File.read(file_name).strip
    grid = Grid.new(key)
    puts grid.count_regions
  end
end
