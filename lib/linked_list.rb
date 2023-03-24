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
      count = 1
      current_node = @head
      while (current_node.next_node != nil)
        current_node = current_node.next_node
        count +=1
      end
      count
  end

  def to_string
    strings = [@head.data]
    current_node = @head
    while (current_node = current_node.next_node)
      strings << current_node.data
    end
    strings.join(" ")
  end

end