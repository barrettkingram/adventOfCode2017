class Day13

  class Scanner

    attr_accessor :depth, :range, :position, :direction

    def initialize(depth, range)
      @depth, @range = depth.to_i, range.to_i
      @position = 0
      @direction = :forward
    end

    def advance
      if @direction == :forward
        if @position == @range - 1
          @direction = :backward
          @position -= 1
        else
          @position += 1
        end
      else
        if @position == 0
          @direction = :forward
          @position += 1
        else
          @position -= 1
        end
      end
    end
  end

  class Firewall

    attr_reader :severity, :caught

    def initialize(input, delay = 0)
      @scanners = []
      input.split("\n").each do |line|
        @scanners << Scanner.new(*line.scan(/\d+(?=:)|(?<= )\d+/))
      end
      @packet_depth = -delay - 1
      @severity = 0
      @caught = false
    end

    def reset(delay)
      @scanners.each do |scanner|
        scanner.position = 0
        scanner.direction = :forward
      end
      @packet_depth = -delay - 1
      @severity = 0
      @caught = false
    end

    def packet_crossed?
      @packet_depth == @scanners.last.depth
    end

    def advance_packet
      @packet_depth += 1
      current_scanner = @scanners.find { |scanner| scanner.depth == @packet_depth }
      if current_scanner && current_scanner.position == 0
        @severity += (current_scanner.depth * current_scanner.range)
        @caught = true
      end
      @scanners.each { |scanner| scanner.advance }
    end
  end

  def self.run_part1(file_name)
    firewall = Firewall.new(File.read(file_name))
    while !firewall.packet_crossed?
      firewall.advance_packet
    end
    puts firewall.severity
  end

  def self.run_part2(file_name)
    delay = 0
    firewall = Firewall.new(File.read(file_name), delay)
    loop do
      caught = false
      while !firewall.packet_crossed?
        firewall.advance_packet
        if firewall.caught
          caught = true
          break
        end
      end
      break if !caught
      delay += 1
      firewall.reset(delay)
    end
    puts delay
  end
end
