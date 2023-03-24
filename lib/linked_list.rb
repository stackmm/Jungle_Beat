class LinkedList
  attr_reader :head
  def initialize()
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = @head
      while (current_node.next_node != nil)
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  def pop
    current_node = @head
    if current_node == nil
      nil
    elsif current_node.next_node == nil
      node_to_pop = current_node
      @head = nil
    else
      while (current_node.next_node.next_node != nil)
        current_node = current_node.next_node
      end
      node_to_pop = current_node.next_node
      current_node.next_node = nil
    end
    node_to_pop.data
  end

  def insert(position, data)
    if @head == nil
      @head = Node.new(data)
    elsif position == 0
      prepend(data)
    else
      new_node = Node.new(data)
      current_node = @head

      (position - 1).times do
        current_node = current_node.next_node
      end

      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def count
    if @head == nil
      0
    else
      count = 1
      current_node = @head
      while (current_node.next_node != nil)
        current_node = current_node.next_node
        count += 1
      end
      count
    end
  end

  def to_string
    if @head == nil
      ""
    else
      strings = [@head.data]
      current_node = @head
      while (current_node = current_node.next_node)
        strings << current_node.data
      end
      strings.join(" ")
    end
  end

  def find(position, num_elements)
    current_node = @head
    count = 0
    while (current_node != nil && count < position)
      current_node = current_node.next_node
      count += 1
    end

    results = []
    while (current_node != nil && num_elements > 0)
      results << current_node.data
      current_node = current_node.next_node
      num_elements -= 1
    end
    results.join(" ")
  end

  def includes?(data)
    current_node = @head

    while (current_node != nil)
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    false
  end

end