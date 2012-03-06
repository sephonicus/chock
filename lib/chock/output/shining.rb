class Chock
  class Shining < Generator
    CHARACTERS = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
  
    attr_accessor :typos
  
    def initialize
      @samples = ['All work and no play makes Jack a dull boy.']
      @typos = [
        # delete a random position
        Proc.new { |t| t.sub(t[rand(t.size)], '') },
        # replace a random position with a random character
        Proc.new { |t| t.sub(t[rand(t.size)], CHARACTERS.sample) },
        # uppercase a random position
        Proc.new { |t| position = rand(t.size); t[position] = t[position].upcase; t },
        # insert a random character at a random position
        Proc.new { |t| t.insert(rand(t.size), CHARACTERS.sample) }
      ]
    end
  
    def add_typo(text)
      # only add a typo 25% of the time
      rand(4) == 0 ? typos.sample.call(text) : text
    end
  
    def sentences(quantity=nil, separator=nil)
      super(quantity, separator) { add_typo(samples.sample.clone) }
    end
    alias :sentence :sentences
  end
end
