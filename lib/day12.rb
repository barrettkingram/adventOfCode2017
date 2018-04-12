class Day12

  class Village

    def initialize(input_lines)
      @graph = {}
      # Create graph structure: {"0" => {:adjacent_vertices=>["1", "2"]}, "1" => {:adjacent_vertices=>["0","3"]}, ... }
      input_lines.each { |line| @graph[line.split[0]] = {adjacent_vertices: line.scan(/> (.*)/).flatten[0].split(',').map(&:strip)} }
      bfs("0")
    end

    def number_connected
      @graph.select! { |_, attributes| attributes[:color] == :black}.size
    end

    def number_of_groups
      count = 1
      delete_found_group
      while @graph.size > 0
        bfs(@graph.keys[0])
        count += 1
        delete_found_group
      end
      count
    end

    private

    def delete_found_group
      @graph.keep_if { |_, attributes| attributes[:color] != :black}
    end

    # Classic BFS algorithm:
    # Color each node as we discover it:
    #   white: undiscovered
    #   gray: discovered
    #   black: discovered and all adjacent nodes discovered
    # At the end of algorithm, all nodes connected to start are black
    def bfs(start)
      @graph.each { |_, attributes| attributes[:color] = :white }
      @graph[start][:color] = :gray
      queue = [start]
      while !queue.empty?
        next_vertex = queue.shift
        @graph[next_vertex][:adjacent_vertices].select { |v| @graph[v][:color] == :white }.each do |vertex|
          @graph[vertex][:color] == :gray
          queue.push(vertex)
        end
        @graph[next_vertex][:color] = :black
      end
    end

  end

  def self.run_part1(file_name)
    village = Village.new(File.readlines(file_name))
    puts village.number_connected
  end

  def self.run_part2(file_name)
    village = Village.new(File.readlines(file_name))
    puts village.number_of_groups
  end

end
