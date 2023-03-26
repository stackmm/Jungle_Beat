class JungleBeat
  attr_reader :list, :rate, :voice
  attr_accessor :rate, :voice

  def initialize()
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
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
    `say -r #{@rate} -v #{@voice} #{beats}`
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

end