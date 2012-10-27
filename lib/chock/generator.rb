class Chock
  class Generator
    DEFAULT_QUANTITY       = 1
    DEFAULT_PARAGRAPH_SIZE = 5
    DEFAULT_LIST_LENGTH    = 3

    NEWLINE = "\n"

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
      separator ||= NEWLINE
      Array.new(quantity).map do
        block ? yield : samples.sample
      end.join(separator)
    end
    alias :sentence :sentences

    def paragraphs(quantity=DEFAULT_QUANTITY, paragraph_size=DEFAULT_PARAGRAPH_SIZE)
      Array.new(quantity) do
        sentences(paragraph_size, ' ')
      end.join(NEWLINE)
    end
    alias :paragraph :paragraphs

    (1..6).each do |number|
      define_method(:"h#{number}") do
        "<h#{number}>#{sentence}</h#{number}>"
      end
    end

    def list(items=DEFAULT_LIST_LENGTH, ordered=false)
      components = ordered ? %w[<ol> </ol>] : %w[<ul> </ul>]
      items.times { components[1, 0] = "<li>#{sentence}</li>" }
      components.join
    end

    def ol(items=DEFAULT_LIST_LENGTH)
      list(items, true)
    end

    def ul(items=DEFAULT_LIST_LENGTH)
      list(items, false)
    end

  end
end
