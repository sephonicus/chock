require 'chock/version'

class Chock
  class Generator
    DEFAULT_QUANTITY       = 1
    DEFAULT_PARAGRAPH_SIZE = 5

    @@modes = {}
    def self.modes
      @@modes
    end

    def self.inherited(subclass)
      mode = subclass.to_s.downcase[/\w+$/].to_sym
      modes[mode] = subclass
    end

    attr_accessor :samples

    def sentences(quantity=nil, separator=nil, &block)
      quantity  ||= DEFAULT_QUANTITY
      separator ||= "\n"
      Array.new(quantity).map do
        block ? yield : samples.sample
      end.join(separator)
    end
    alias :sentence :sentences

    def paragraphs(quantity=DEFAULT_QUANTITY, paragraph_size=DEFAULT_PARAGRAPH_SIZE)
      Array.new(quantity) do
        sentences(paragraph_size, ' ')
      end.join("\n")
    end
    alias :paragraph :paragraphs
  end

  class Lorem < Generator
    def initialize
      @samples = [
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      ]
    end
  end

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

  class << self
    def modes
      Chock::Generator.modes.keys
    end

    Chock::Generator.modes.keys.each do |mode|
      define_method mode do
        Chock::Generator.modes[mode].new
      end
    end
  end
end
