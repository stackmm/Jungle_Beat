class LinkedList

  attr_reader :head
  def initialize()
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if self.is_empty?
      0
    else
      count = 1
      node = @head
      while (node = node.next_node)
        node = node.next_node
        count +=1
      end
      count
    end
  end

  def to_string
    node = @head
    p node

    while (node = node.next_node)
      p node
    end
  end

end