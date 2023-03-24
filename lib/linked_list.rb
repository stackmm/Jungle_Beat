class LinkedList

  attr_reader :head
  def initialize()
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
      count = 1
      node = @head
      while (node = node.next_node)
        node = node.next_node
        count +=1
      end
      count
  end

  def to_string
    p @head.data
    # node = @head
    # while (node.next_node != nil)
    #   p node.data
    # end
  end

end