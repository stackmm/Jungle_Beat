class JungleBeat
  attr_reader :list

  def initialize()
    @list = LinkedList.new
  end

  def append(strings)
    strings_array = strings.downcase.split(' ')

    strings_array.each do |string|
      @list.append(string)
    end
  end

end