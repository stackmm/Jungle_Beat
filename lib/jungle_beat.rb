class JungleBeat
  attr_reader :list

  def initialize()
    @list = LinkedList.new
  end

  def append(strings)
    valid_beats = ["bah", "beep", "boom", "boop", "blop", "dee",
                  "deep", "ditt", "doo", "dop", "doop", "hoo", "hu",
                  "la", "lala", "moop", "meow", "na", "plop", "shi", 
                  "shu", "suu", "tee", "vroom", "wee", "woo", "wow"]
    validated_strings = []
    
    strings_array = strings.downcase.split(' ')
    
    strings_array.each do |string|
      if valid_beats.include?(string)
        validated_strings << string
      end
    end

    validated_strings.each do |valid_string|
      @list.append(valid_string)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 -v Boing #{beats}`
  end
  
end