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

    # Check if scanner is at the top when the packet enters its layer
    def catches_packet?(delay)
      (delay + @depth) % ((@range - 1) * 2) == 0
    end

  end

  class Firewall

    attr_reader :severity, :caught, :scanners

    def initialize(input)
      @scanners = []
      input.split("\n").each do |line|
        @scanners << Scanner.new(*line.scan(/\d+(?=:)|(?<= )\d+/))
      end
      @packet_depth = -1
      @severity = 0
    end

    def packet_crossed?
      @packet_depth == @scanners.last.depth
    end

    def advance_packet
      @packet_depth += 1
      current_scanner = @scanners.find { |scanner| scanner.depth == @packet_depth }
      if current_scanner && current_scanner.position == 0
        @severity += (current_scanner.depth * current_scanner.range)
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
    firewall = Firewall.new(File.read(file_name))
    safe_delays = (0..Float::INFINITY).lazy
    firewall.scanners.each { |scanner| safe_delays = safe_delays.reject { |delay| scanner.catches_packet? delay } }
    puts safe_delays.first
  end
end
