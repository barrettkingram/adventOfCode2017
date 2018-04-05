# https://www.redblobgames.com/grids/hexagons/#distances-cube
class Day11

  class HexGrid

    attr_reader :child_distance

    def initialize(directions)
      @distances = [0]
      @child_location = get_coordinate(directions)
      @child_distance = @child_location.distance_from_origin
    end

    def max_distance
      @distances.max
    end

    private

    def get_coordinate(directions)
      coordinate = Coordinate.new(0, 0, 0)
      directions.each do |direction|
        case direction
        when "n"
          coordinate + [0, 1, -1]
        when "ne"
          coordinate + [1, 0, -1]
        when "se"
          coordinate + [1, -1, 0]
        when "s"
          coordinate + [0, -1, 1]
        when "sw"
          coordinate + [-1, 0, 1]
        when "nw"
          coordinate + [-1, 1, 0]
        end
        @distances << coordinate.distance_from_origin
      end
      coordinate
    end

    class Coordinate

      attr_reader :x, :y, :z

      def initialize(x, y, z)
        @x = x
        @y = y
        @z = z
      end

      def +(addend)
        if addend.is_a?(Array)
          @x += addend[0]
          @y += addend[1]
          @z += addend[2]
        end
      end

      def distance_from_origin
        (@x.abs + @y.abs + @z.abs) / 2
      end

    end

  end

  def self.run_part1(file_name)
    hex_grid = HexGrid.new(File.read(file_name).strip.split(','))
    puts hex_grid.child_distance
  end

  def self.run_part2(file_name)
    hex_grid = HexGrid.new(File.read(file_name).strip.split(','))
    puts hex_grid.max_distance
  end

end
