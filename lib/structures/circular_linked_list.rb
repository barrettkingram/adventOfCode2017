class CircularLinkedList
  class Node
    attr_accessor :value, :next
    def initialize(value)
      @value = value
      @next = nil
    end
  end

  def initialize(value)
    @head = Node.new(value)
    @head.next = @head
    @current = @head
    @size = 1
  end

  def advance_current_position
    @current = @current.next
  end

  def insert_after_current(value)
    new_node = Node.new(value)
    new_node.next = @current.next
    @current.next = new_node
    @size += 1
  end

  def get(index)
    current = @head
    index.times { current = current.next }
    current.value
  end

  def to_s
    string = ''
    current = @head
    @size.times do
      string += "#{current.value} "
      current = current.next
    end
    string
  end
end
